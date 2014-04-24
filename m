From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77857] Second Monitor Stopped Working
Date: Thu, 24 Apr 2014 03:58:34 +0000
Message-ID: <bug-77857-8800-gmEQ4N1WFM@http.bugs.freedesktop.org/>
References: <bug-77857-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0352678430=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77857-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0352678430==
Content-Type: multipart/alternative; boundary="1398311913.2F4A01.29555"; charset="us-ascii"


--1398311913.2F4A01.29555
Date: Thu, 24 Apr 2014 03:58:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77857

--- Comment #4 from eagle_boy-ur4TIblo6goN+BqQ9rBEUg@public.gmane.org ---
I originally had the NVIDIA driver installed and when I got my second monitor I
uninstalled the NVIDIA driver and installed nouveau. I then modified my
xorg.conf to 

Section "Device"
Identifier "n"
Driver "nouveau"
EndSection

and everything worked fine. But when installed 3.11.0-20 it stopped working.

I checked my blacklist.conf and I only haev the following items in it

blacklist evbug
blacklist usbmouse
blacklist usbkbd
blacklist eepro100
blacklist de4x5
blacklist eth1394
blacklist snd_intel8x0m
blacklist snd_aw2
blacklist i2c_i801
blacklist prism54
blacklist bcm43xx
blacklist garmin_gps
blacklist asus_acpi
blacklist snd_pcsp
blacklist pcspkr
blacklist amd76x_edac

Is there somewhere I can check to see if something got miss configured?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1398311913.2F4A01.29555
Date: Thu, 24 Apr 2014 03:58:33 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Second Monitor Stopped Working"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77857#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Second Monitor Stopped Working"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77857">bug 77857</a>
              from <span class="vcard"><a class="email" href="mailto:eagle_boy&#64;rocketmail.com" title="eagle_boy&#64;rocketmail.com">eagle_boy&#64;rocketmail.com</a>
</span></b>
        <pre>I originally had the NVIDIA driver installed and when I got my second monitor I
uninstalled the NVIDIA driver and installed nouveau. I then modified my
xorg.conf to 

Section &quot;Device&quot;
Identifier &quot;n&quot;
Driver &quot;nouveau&quot;
EndSection

and everything worked fine. But when installed 3.11.0-20 it stopped working.

I checked my blacklist.conf and I only haev the following items in it

blacklist evbug
blacklist usbmouse
blacklist usbkbd
blacklist eepro100
blacklist de4x5
blacklist eth1394
blacklist snd_intel8x0m
blacklist snd_aw2
blacklist i2c_i801
blacklist prism54
blacklist bcm43xx
blacklist garmin_gps
blacklist asus_acpi
blacklist snd_pcsp
blacklist pcspkr
blacklist amd76x_edac

Is there somewhere I can check to see if something got miss configured?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1398311913.2F4A01.29555--

--===============0352678430==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0352678430==--
