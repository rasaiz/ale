{if $enddate!=null && $enddate >0 }

    <script type="text/javascript">
        $(document).ready(function () {
            $('.future_date_{$id_cate}_{$idproduct}').countdown({
                until: new Date({$enddate|date_format:"%Y"}, {$enddate|date_format:"%m"}-1, {$enddate|date_format:"%d"}, {$enddate|date_format:"%H"}, {$enddate|date_format:"%M"}, {$enddate|date_format:"%S"}),
				labels: ['{l s='Years' mod='labcountdown'}', '{l s='Months' mod='labcountdown'}', '{l s='Weeks' mod='labcountdown'}', '{l s='Days' mod='labcountdown'}', '{l s='Hrs' mod='labcountdown'}', '{l s='Mins' mod='labcountdown'}', '{l s='Secs' mod='labcountdown'}'],
				labels1: ['{l s='Year' mod='labcountdown'}', '{l s='Month' mod='labcountdown'}', '{l s='Week' mod='labcountdown'}', '{l s='Day' mod='labcountdown'}', '{l s='Hour' mod='labcountdown'}', '{l s='Minute' mod='labcountdown'}', '{l s='Second' mod='labcountdown'}'],
			});
        });
    </script>
{/if}
