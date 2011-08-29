From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: [TESTING CALL] Fan management
Date: Mon, 29 Aug 2011 16:07:15 +0200
Message-ID: <4E5B9D13.90605@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0834674850=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--===============0834674850==
Content-Type: multipart/alternative;
 boundary="------------070902050608030309010408"

This is a multi-part message in MIME format.
--------------070902050608030309010408
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Nouveau users,

Just saw the bitching on Phoronix about lack of fan management in 
nouveau (no offence Michael, it was justified ;) ).
Since it has been working flawlessly for more than a week on my desktop, 
I decided to let you guys know about it and ask for testing.

Here is the code: 
http://gitorious.org/linux-nouveau-pm/linux-nouveau-pm/commits/thermal
Please read the following paragraphs before pulling this branch and fry 
your GPU.

The hardware and current limitations
---------------------------------------------------

This branch introduces code to drive the most common fan type (and the 
most problematic one, I guess/hope). We call them PWM fan.
The other types are TOGGLE (can only be ON or OFF) and I2C (driven using 
an I2C chip).

The TOGGLE fans aren't supported because I think I lack the hw (to be 
confirmed).

The PWM fans are the most common ones. It supports a full range of speed 
(from 0% to 100%).

The I2C-accessible fans are usually limited to high-end cards. At the 
moment, the only thing we can do for them is to launch their hwmon driver.
This is due to a limitation in hwmon that doesn't let kernel drivers 
accessing the i2c chips' methods. We are working with the hwmon team and 
provided
a patch to support that: 
http://www.spinics.net/lists/lm-sensors/msg32906.html
If you have such a fan, you can manage it from the userspace.

The implemented fan management support
-----------------------------------------------------------

Current fan management should only work on what we call PWM fans.

This work should be usable up to (not including) nva3 chipset generation.
This is because nva3+ cards all have hw to drive the speed of the fan 
(pwm or i2c).

Reading the fan speed (power): cat /sys/class/drm/cardX/device/pwm0

Reading the fan speed (RPM): cat /sys/class/drm/cardX/device/fan0_input

Setting the fan management method: echo X > 
/sys/class/drm/cardX/device/pwm0_enable
- X = 0: Fan management disabled, fan power set to 100%
- X = 1: Manual fan management (you can set the speed by writing 
[0->100] to /sys/class/drm/cardX/device/pwm0)
- X = 2: The default automatic fan management (equivalent to X = 3 for 
the moment)
- X = 3: Linear fan management. The fan speed is linearly correlated to 
the temperature.
- X = 4: Target temperature management. The fan is driven to keep the 
GPU to a certain temperature

The thermal zone implementation
------------------------------------------------

Since I believe thermal zones are great but massively under-used. I used 
thermal zones to define some trip points.

Here are some noteworthy trip points:
- Default mode: Listen to the user commands
- Fan boost: Whenever the GPU reaches this temperature, the fan will 
blow at 100%
- Downclocking: Whenever the GPU reaches this temperature, your GPU will 
be downclocked to the lowest perflvl
- Critical: Whenever the GPU reaches this temperature, your computer 
will shut down to prevent damages.

BIG FAT WARNING
-----------------------------

For those willing to try this, please watch your GPU temperature closely 
at any time using "$ sensors" and your fingers.
If you think sensors doesn't report the right temperature, please send 
us a mail with your vbios and show up on IRC (ask mupuf).

Check this before having fun with fan management, it is very important!

Installation
------------------

cd my_package_directory
git clone git://gitorious.org/linux-nouveau-pm/linux-nouveau-pm.git
git branch --track thermal origin/thermal

Then it is just a matter of compiling and testing your kernel. Please 
follow your distribution's guide.

Report
------------

Please report your story on our IRC channel. Please also send your 
kernel logs along with your vbios to martin.peres <at> free(dot)fr.

Conclusion
------------

Hope you like it. Keep us informed of how well it works ;)

Martin (AKA mupuf)

PS: Another testing call about power management should also follow but 
there is something I want to implement before people try it.

--------------070902050608030309010408
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Hi Nouveau users,<br>
    <br>
    Just saw the bitching on Phoronix about lack of fan management in
    nouveau (no offence Michael, it was justified ;) ).<br>
    Since it has been working flawlessly for more than a week on my
    desktop, I decided to let you guys know about it and ask for
    testing.<br>
    <br>
    Here is the code:
    <meta http-equiv="content-type" content="text/html;
      charset=ISO-8859-1">
    <a
href="http://gitorious.org/linux-nouveau-pm/linux-nouveau-pm/commits/thermal">http://gitorious.org/linux-nouveau-pm/linux-nouveau-pm/commits/thermal</a><br>
    Please read the following paragraphs before pulling this branch and
    fry your GPU.<br>
    <br>
    The hardware and current limitations<br>
    ---------------------------------------------------<br>
    <br>
    This branch introduces code to drive the most common fan type (and
    the most problematic one, I guess/hope). We call them PWM fan.<br>
    The other types are TOGGLE (can only be ON or OFF) and I2C (driven
    using an I2C chip).<br>
    <br>
    The TOGGLE fans aren't supported because I think I lack the hw (to
    be confirmed). <br>
    <br>
    The PWM fans are the most common ones. It supports a full range of
    speed (from 0% to 100%).<br>
    <br>
    The I2C-accessible fans are usually limited to high-end cards. At
    the moment, the only thing we can do for them is to launch their
    hwmon driver.<br>
    This is due to a limitation in hwmon that doesn't let kernel drivers
    accessing the i2c chips' methods. We are working with the hwmon team
    and provided<br>
    a patch to support that:
    <meta http-equiv="content-type" content="text/html;
      charset=ISO-8859-1">
    <a href="http://www.spinics.net/lists/lm-sensors/msg32906.html">http://www.spinics.net/lists/lm-sensors/msg32906.html</a><br>
    If you have such a fan, you can manage it from the userspace.<br>
    <br>
    The implemented fan management support<br>
    -----------------------------------------------------------<br>
    <br>
    Current fan management should only work on what we call PWM fans.<br>
    <br>
    This work should be usable up to (not including) nva3 chipset
    generation.<br>
    This is because nva3+ cards all have hw to drive the speed of the
    fan (pwm or i2c).<br>
    <br>
    Reading the fan speed (power): cat /sys/class/drm/cardX/device/pwm0<br>
    <br>
    Reading the fan speed (RPM): cat
    /sys/class/drm/cardX/device/fan0_input<br>
    <br>
    Setting the fan management method: echo X &gt;
    /sys/class/drm/cardX/device/pwm0_enable<br>
    - X = 0: Fan management disabled, fan power set to 100%<br>
    - X = 1: Manual fan management (you can set the speed by writing
    [0-&gt;100] to /sys/class/drm/cardX/device/pwm0)<br>
    - X = 2: The default automatic fan management (equivalent to X = 3
    for the moment)<br>
    - X = 3: Linear fan management. The fan speed is linearly correlated
    to the temperature.<br>
    - X = 4: Target temperature management. The fan is driven to keep
    the GPU to a certain temperature<br>
    <br>
    The thermal zone implementation<br>
    ------------------------------------------------<br>
    <br>
    Since I believe thermal zones are great but massively under-used. I
    used thermal zones to define some trip points.<br>
    <br>
    Here are some noteworthy trip points:<br>
    - Default mode: Listen to the user commands<br>
    - Fan boost: Whenever the GPU reaches this temperature, the fan will
    blow at 100%<br>
    - Downclocking: Whenever the GPU reaches this temperature, your GPU
    will be downclocked to the lowest perflvl<br>
    - Critical: Whenever the GPU reaches this temperature, your computer
    will shut down to prevent damages.<br>
    <br>
    BIG FAT WARNING<br>
    -----------------------------<br>
    <br>
    For those willing to try this, please watch your GPU temperature
    closely at any time using "$ sensors" and your fingers.<br>
    If you think sensors doesn't report the right temperature, please
    send us a mail with your vbios and show up on IRC (ask mupuf).<br>
    <br>
    Check this before having fun with fan management, it is very
    important!<br>
    <br>
    Installation<br>
    ------------------<br>
    <br>
    cd my_package_directory<br>
    git clone git://gitorious.org/linux-nouveau-pm/linux-nouveau-pm.git<br>
    git branch --track thermal origin/thermal<br>
    <br>
    Then it is just a matter of compiling and testing your kernel.
    Please follow your distribution's guide.<br>
    <br>
    Report<br>
    ------------<br>
    <br>
    Please report your story on our IRC channel. Please also send your
    kernel logs along with your vbios to martin.peres &lt;at&gt;
    free(dot)fr.<br>
    <br>
    Conclusion<br>
    ------------<br>
    <br>
    Hope you like it. Keep us informed of how well it works ;)<br>
    <br>
    Martin (AKA mupuf)<br>
    <br>
    PS: Another testing call about power management should also follow
    but there is something I want to implement before people try it.<br>
  </body>
</html>

--------------070902050608030309010408--

--===============0834674850==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0834674850==--
