From: Martin Peres <martin.peres@free.fr>
Subject: Request for nv40-c0 testing thermal/fan management
Date: Mon, 17 Dec 2012 03:36:16 +0100
Message-ID: <50CE8520.1010500@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: nouveau <Nouveau@lists.freedesktop.org>
Cc: dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Hi Nouveau enthusiasts,

One week ago was merged the thermal/fan management code for most nvidia 
cards.

So far, no major issue arose but we would like to have more testing as 
soon as possible to deliver a nice and solid support when Linux 3.8 is 
released.

Thermal management is split into two parts:

- Temperature monitoring: Making sure your card doesn't overheat
- Fan management: Driving the fan speed according to the temperature

Thermal monitoring should be working on all chipsets that support it 
(nv43+). However, some cards use an external (i2c) monitoring chip. 
Because of the limitations of the hwmon interface, we cannot access this 
information and thus, cannot monitor the temperature of your card 
ourselves. However, we should be able to load the right kernel module so 
as you can monitor it for us.

As for fan management, the situation is the same as thermal mangement 
with the additional limitation that nvc0+ (Fermi+) chipsets are not 
supported for fan management. The reason is that nvc0+ chipset use an 
internal engine (PDAEMON) that is already set up by the vbios to do fan 
management and we didn't feel like getting rid of it just yet even 
though some experimental code for its replacement is already available.

What we are trying to avoid is:

VERY IMPORTANT:
- No temperature at all while the blob reports one!
- Inaccurate temperature (we already have a bug report for that on nv4x)

IMPORTANT:
- The fan/card makes a strange noise while driving the fan
- You manage to stop the fan without fiddling with pwm_min
- Non-linear fan speed with PWM value

Please report if one of these issues occur. If you experience something 
strange that isn't on the list, please inform us too :)

Complete documentation for thermal management is available at 
/Documentation/thermal/nouveau_thermal 
(http://cgit.freedesktop.org/nouveau/linux-2.6/tree/Documentation/thermal/nouveau_thermal).

Looking forward to your feedback!

Cheers,

Martin (AKA mupuf)
