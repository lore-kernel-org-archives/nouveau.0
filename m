From: Mr Dash Four <mr.dash.four-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [TESTING CALL] Fan management
Date: Wed, 31 Aug 2011 12:48:55 +0100
Message-ID: <4E5E1FA7.2010705@googlemail.com>
References: <4E5B9D13.90605@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4E5B9D13.90605-GANU6spQydw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Cc: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org


> The implemented fan management support
> -----------------------------------------------------------
>
> Current fan management should only work on what we call PWM fans.
>
> This work should be usable up to (not including) nva3 chipset generation.
> This is because nva3+ cards all have hw to drive the speed of the fan 
> (pwm or i2c).
>
> Reading the fan speed (power): cat /sys/class/drm/cardX/device/pwm0
>
> Reading the fan speed (RPM): cat /sys/class/drm/cardX/device/fan0_input
>
> Setting the fan management method: echo X > 
> /sys/class/drm/cardX/device/pwm0_enable
> - X = 0: Fan management disabled, fan power set to 100%
> - X = 1: Manual fan management (you can set the speed by writing 
> [0->100] to /sys/class/drm/cardX/device/pwm0)
> - X = 2: The default automatic fan management (equivalent to X = 3 for 
> the moment)
> - X = 3: Linear fan management. The fan speed is linearly correlated 
> to the temperature.
> - X = 4: Target temperature management. The fan is driven to keep the 
> GPU to a certain temperature
I have 7800gs (NV49) card and tried to use the new driver yesterday 
after pulling the latest source, compiling and installing it. 
Unfortunately, pwm0_enable is not showing up, so I am unable to use the 
fan management at all. Previous attempts to write values to either 
/sys/class/drm/cardX/device/pwm0 or the port itself (using nvpoke) also 
failed - even though the value changes the fan speed stays the same. I 
was hoping that the latest additions will solve these problems and 
reduce the noise coming out of the fan (blasting at 100%), but that 
seems to be way off, at least for now.

What could be the problem? Could it be that my card is using i2c 
instead? Any ideas?
