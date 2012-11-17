From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56340] [Ubuntu 10.04.4 LTS 32-bit] Severe
 instability of VIA Technologies Apollo MVP3 chipset and NVIDIA RIVA TNT2
 M64 graphics
Date: Sat, 17 Nov 2012 03:01:03 +0000
Message-ID: <bug-56340-8800-cmTJHIZyU9@http.bugs.freedesktop.org/>
References: <bug-56340-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1845882795=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-56340-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1845882795==
Content-Type: multipart/alternative; boundary="1353121263.8BA51.11836"; charset="us-ascii"


--1353121263.8BA51.11836
Date: Sat, 17 Nov 2012 03:01:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56340

--- Comment #10 from mypersonalmailbox1-O5WfVfzUwx8@public.gmane.org ---
Hi,

Based on Robert's suggestions, I went back and fiddled with some of the BIOS
settings.
In the past testing, I didn't see too much difference in system stability, but
this time around, I turned on and off one BIOS setting at a time.
I can now say that turning off AGP 2X Mode and using AGP 1X Mode does stabilize
the system.
This is despite using aggressive memory and PCI related system parameters from
the BIOS setup.
Turning off AGP 2X Mode is the only setting the makes or breaks the system.
Because of this, I am writing this comment from the very same system (AMD K6-2
450 MHz, FIC VA-503+ mainboard, 512 MB SDRAM, VisionTek RIVA TNT2 64 16MB AGP
graphics card) that used to crash most of the time during boot.
By the way, I was also able to capture the error message on my digital camera,
and I will upload that a little later.
If I activated AGP 2X Mode, I do get the following error message right before
the freeze.

 . . . GPU lockup - switching to software fbcon

Sorry, the picture quality is not the best one can get, hence, I am not able to
transcribe the message 100% correctly, but this is the error message that got
displayed if I pressed Esc key during Ubuntu's bootup.
Again, if I don't use AGP 2X Mode (using AGP 1X Mode), it won't display this
message.
I guess the question now is why does Nouveau display this error message in the
first place if I use AGP 2X Mode, but not in AGP 1X Mode?

Regards,

fpgahardwareengineer

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1353121263.8BA51.11836
Date: Sat, 17 Nov 2012 03:01:03 +0000
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
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [Ubuntu 10.04.4 LTS 32-bit] Severe instability of VIA Technologies Apollo MVP3 chipset and NVIDIA RIVA TNT2 M64 graphics"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56340#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [Ubuntu 10.04.4 LTS 32-bit] Severe instability of VIA Technologies Apollo MVP3 chipset and NVIDIA RIVA TNT2 M64 graphics"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56340">bug 56340</a>
              from <span class="vcard"><a class="email" href="mailto:mypersonalmailbox1&#64;mail.com" title="mypersonalmailbox1&#64;mail.com">mypersonalmailbox1&#64;mail.com</a>
</span></b>
        <pre>Hi,

Based on Robert's suggestions, I went back and fiddled with some of the BIOS
settings.
In the past testing, I didn't see too much difference in system stability, but
this time around, I turned on and off one BIOS setting at a time.
I can now say that turning off AGP 2X Mode and using AGP 1X Mode does stabilize
the system.
This is despite using aggressive memory and PCI related system parameters from
the BIOS setup.
Turning off AGP 2X Mode is the only setting the makes or breaks the system.
Because of this, I am writing this comment from the very same system (AMD K6-2
450 MHz, FIC VA-503+ mainboard, 512 MB SDRAM, VisionTek RIVA TNT2 64 16MB AGP
graphics card) that used to crash most of the time during boot.
By the way, I was also able to capture the error message on my digital camera,
and I will upload that a little later.
If I activated AGP 2X Mode, I do get the following error message right before
the freeze.

 . . . GPU lockup - switching to software fbcon

Sorry, the picture quality is not the best one can get, hence, I am not able to
transcribe the message 100% correctly, but this is the error message that got
displayed if I pressed Esc key during Ubuntu's bootup.
Again, if I don't use AGP 2X Mode (using AGP 1X Mode), it won't display this
message.
I guess the question now is why does Nouveau display this error message in the
first place if I use AGP 2X Mode, but not in AGP 1X Mode?

Regards,

fpgahardwareengineer</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1353121263.8BA51.11836--

--===============1845882795==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1845882795==--
