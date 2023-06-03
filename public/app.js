jQuery(document).ready(function() {
    // Apply code for all job items on page
    jQuery('.job__item').each(function() {
        // every job item has own id
        const jobId = jQuery(this).attr('data-job-id');
        const $jobItem = jQuery(this);
        const $slideElement = jQuery(this).find('.job__item__slide');
        // for handling input on email
        const $emailField = jQuery($slideElement).find('#email-field');

        // toggler of item
        jQuery(this).find('.slide-toggler').click(function() {
            if($slideElement.is(":visible")) {
                $slideElement.slideUp(150);
                // @todo replace for icons
                jQuery(this).html('+');
            } else {
                $slideElement.slideDown(150);
                // @todo replace for icons
                jQuery(this).html('x');
            }
        });

        // debouncing email timerID. mission to not send request to server on every input change
        let debounceEmailTimer = -1;

        const getUserSkills = (competitorId) => {
            jQuery.ajax({
                url: '/application/skills',
                data: {
                    competitor_id: competitorId,
                    job_id: jobId
                },

                success: function(msg) {
                    msg.skills.forEach((skill) => {
                        $jobItem.find(`#competence-${skill.competence_id}`).val(skill.level_id);
                    });
                },
            });
        };

        // Binding email field change. Mandatory field. Sends ajax request with debouncing
        $emailField.on('change', function() {
            const fieldValue = jQuery(this).val();

            if(fieldValue === "") {
                return false;
            }

            window.clearTimeout(debounceEmailTimer);
            debounceEmailTimer = setTimeout(() => {
                jQuery.ajax({
                    url: '/competitor/email',
                    data: {
                        email: fieldValue
                    },

                    beforeSend: function() {
                        // set disabled on input
                        $jobItem.find('input').prop('disabled', true);
                    },

                    success: function(msg) {
                        // fetch user skills by id and email
                        getUserSkills(msg.id);

                        // trigger change is for triggering event
                        $jobItem.find('#name-field').val(msg.name).trigger('change');
                        $jobItem.find('#phone-field').val(msg.phone).trigger('change');
                    },

                    complete: function() {
                        $jobItem.find('input').prop('disabled', false);
                    }
                });
            }, 600);
        });

        // count filled inputs count in contact form. 3 is always required to be filled
        $jobItem.find('input').on('change', function () {
            const $inputs =  $jobItem.find('input');

            let filledCount = 0;

            $inputs.each(function() {
                if(jQuery(this).val() !== '') {
                    filledCount++;
                }
            });

            $jobItem.find('button[type="submit"]').prop('disabled', filledCount !== $inputs.length);
        });
    });

    // adds slide to application item on /joblist/
    jQuery('.job__item__slide--application').each(function() {
        const $slideElement = jQuery(this).find('.job__item__slide--application--slide');

        jQuery(this).find('.application-toggler').click(function() {
            if($slideElement.is(":visible")) {
                $slideElement.slideUp(150);
                   // @todo replace for icons
                jQuery(this).html('+');
            } else {
                $slideElement.slideDown(150);
                // @todo replace for icons
                jQuery(this).html('x');
            }
        });
    });
});
