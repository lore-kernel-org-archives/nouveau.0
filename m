From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [lm-sensors] hwmon: question about the sysfs interface
Date: Wed, 16 Jul 2014 23:42:22 -0700
Message-ID: <53C7704E.4060705@roeck-us.net>
References: <20140714164728.GA1041@elysium.lan>
 <20140714172556.GA3753@roeck-us.net> <20140717062929.GA1487@elysium.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20140717062929.GA1487-kWTPUKa9AM/hXIiyNabO3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Gianni Vialetto <gianni-1aVadY534Hbk1uMJSBkQmQ@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 07/16/2014 11:29 PM, Gianni Vialetto wrote:
> Hi Guenter,
>
>> For automatic fan control we don't really have a well defined ABI.
>> Part of the problem is that the mechanisms used by various chips are
>> quite different.
>>
>> Please have a look into Documentation/hwmon/nct6775. It is by far
>> the driver with the most comprehensive fan control mechanisms and
>> attributes. Would any of the attributes or atribute groups in this
>> driver meet your needs ? I could imagine that pwm1_target_temp
>> for the upper temperature limit and pwm1_temp_tolerance for the difference
>> between upper and lower limit might do. Then there are other attributes
>> such as pxm1_start, pwm1_floor, pwm1_step, and pwm1_max which you
>> could use to control pwm values further is that is possible with the
>> driver.
>
> Using pwm1_target_temp and pwm1_temp_tolerance seems a like nice idea,
> yes. Some of the other attributes are already used and I'm not certain
> how much I should change at this point.
>
I can not really comment on this. We prefer to retain at least some level
of attribute name consistency, but the Nouveau hwmon driver pretty much
bypasses hwmon review anyway, so from a practical perspective you can
invent as many new attribute names as you like.

Guenter

>> An alternative would be to use two sets of pwm_auto_point attributes,
>> where the first set specifies the start pwm limit and the second
>> specifies the upper temperature and limit. So you would have something
>> like
>>
>> 	pwm1_auto_point1_pwm	pwm at low temperature
>> 	pwm1_auto_point1_temp	low temperature
>>
>> 	pwm1_auto_point2_pwm	pwm at high temperature
>> 	pwm1_auto_point2_temp	high temperature
>>
>> After all, there is no requirement that pwm must exactly match the configured
>> value; the above only means that the chip uses those values to calculate
>> the necessary fan speed. In addition to that, you could still have some
>> of the other attributes as needed, such as pwm1_min, pwm1_max, and so on.
>
> This was my initial plan, roughly, but I like the first solution more at
> this point.
>
>> Hope this helps,
>> Guenter
>
> Definitely. Thank you.
>
> Regards,
> Gianni
>
>
