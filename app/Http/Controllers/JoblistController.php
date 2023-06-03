<?php

namespace App\Http\Controllers;

use App\Competences;
use App\Job;
use App\Level;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class JoblistController extends Controller
{
    public function index() {
        $jobs = Job::query()
            ->with([
                'competences',
                'applications',
                'applications.skills',
                'applications.skills.competence',
                'applications.skills.level',
                'applications.competitor'
            ])
            ->get()
            ->sort(function($a, $b) {
                // Sorting all applications by created_at DESC. 

                $aObject = $a->applications()->latest()->first() ?? null;
                $bObject = $b->applications()->latest()->first() ?? null;

                if(!$aObject) {
                    return 1;
                }

                if(!$bObject) {
                    return -1;
                }

                return $bObject->created_at->timestamp - $aObject->created_at->timestamp;
            })
            ->toArray();

        // Calculating total weight per application
        foreach($jobs as $jobId=>$job) {
            foreach($job['applications'] as $key=>$application) {
                $totalWeight = 0;

                // multiply user competence high and level factor
                foreach($application['skills'] as $skill) {
                    $totalWeight += $skill['competence']['height']*$skill['level']['factor'];
                }

                $jobs[$jobId]['applications'][$key]['weight'] = $totalWeight;
            }

            // sort applications by its weight
            usort($jobs[$jobId]['applications'], function($a, $b) {
                return $b['weight'] - $a['weight'];
            });
        }

        return view('joblist', [
            'jobs' => $jobs
        ]);
    }

    public function newJob(Request $request) {
        // if POST  method is being used - handle request
        if($request->method() === 'POST') {
            $request->validate([
                'name' => 'required|string|max:128',
                'competences' => 'required'
            ]);

            $name = $request->post('name');
            $competences = $request->post('competences');

            // competences are required
            if(count($competences) == 0) {
                return view('newjob')->with([
                    'error' => 'Provide any competence for new job'
                ]);
            }

            // start transation for aborting queries on error
            DB::beginTransaction();

            try {
                // Create new job in database
                $job = new Job();
                $job->setAttribute('job', $name);

                if(!$job->save()) {
                    throw new \Exception();
                }

                $totalWeight = 0;
                $createdCompetences = [];

                foreach($competences['name'] as $key=>$name) {
                    $weight = $competences['weight'][$key] ?? '';

                    if(empty($name) || empty($weight)) {
                        continue;
                    }

                    $totalWeight += $weight;

                    $competence = new Competences();
                    $competence->competence = $name;
                    $competence->height = $weight;
                    $competence->job_id = $job->id;

                    $createdCompetences[] = $competence;
                }

                // Total weight of all competences in job must be equal 100
                if($totalWeight != 100) {
                    DB::rollBack();
                    return view('newjob')->with([
                        'error' => 'Total weight of all competences must equal 100'
                    ]);
                }

                // Bulk save created competences in database
                foreach($createdCompetences as $competence) {
                    if(!$competence->save()) {
                        throw new \Exception();
                    }
                }

            } catch(\Exception $e) {
                DB::rollBack();
                return view('newjob')->with([
                    'error' => 'Internal server error'
                ]);
            }

            DB::commit();

            return redirect('/joblist')->with([
                'success' => 'New job was successfully created'
            ]);
        }

        return view('newjob');
    }
}
