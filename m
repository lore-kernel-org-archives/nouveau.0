From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 47796] Powerpoint 2010 Viewer crashes with Wine and
 the Nouveau driver: "Unhandled exception: assertion failed"
Date: Sat, 12 Jan 2013 23:45:00 +0000
Message-ID: <bug-47796-8800-Zk96Stbx76@http.bugs.freedesktop.org/>
References: <bug-47796-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0071040890=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-47796-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0071040890==
Content-Type: multipart/alternative; boundary="1358034300.fc7eeebF1.22267"; charset="us-ascii"


--1358034300.fc7eeebF1.22267
Date: Sat, 12 Jan 2013 23:45:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=47796

--- Comment #3 from Trek <trek00-aPYA7nAdAYY@public.gmane.org> ---
I think to have the same bug. I filed a complete report at:

http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=697913

The error message is:

nv10_state_fb.c:50: get_rt_format: Assertion `0' failed.

The installed drivers are:

libdrm-nouveau1a 2.4.33-3 i386
libgl1-mesa-dri 8.0.5-3 i386
libgl1-mesa-glx 8.0.5-3 i386
linux-image-3.2.0-4-686-pae 3.2.35-2 i386
xserver-xorg-video-nouveau 1:1.0.1-4 i386

The video card is:

NVIDIA Corporation NV11 [GeForce2 MX/MX 400] (rev a1)


It seems to me that this bug can be merged with:

https://bugs.freedesktop.org/show_bug.cgi?id=49148

that contains also a patch.


This bug seems to affect some user, that filed these bug reports:

https://bugs.launchpad.net/ubuntu/+source/stellarium/+bug/1079011
https://bugzilla.redhat.com/show_bug.cgi?id=834329


I hope to have the time to setup a build environment to test the patch on my
hardware, but in the meantime I wanted you to know about the situation.

Ciao

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1358034300.fc7eeebF1.22267
Date: Sat, 12 Jan 2013 23:45:00 +0000
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
   title="NEW --- - Powerpoint 2010 Viewer crashes with Wine and the Nouveau driver: &quot;Unhandled exception: assertion failed&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=47796#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Powerpoint 2010 Viewer crashes with Wine and the Nouveau driver: &quot;Unhandled exception: assertion failed&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=47796">bug 47796</a>
              from <span class="vcard"><a class="email" href="mailto:trek00&#64;inbox.ru" title="Trek &lt;trek00&#64;inbox.ru&gt;"> <span class="fn">Trek</span></a>
</span></b>
        <pre>I think to have the same bug. I filed a complete report at:

<a href="http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=697913">http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=697913</a>

The error message is:

nv10_state_fb.c:50: get_rt_format: Assertion `0' failed.

The installed drivers are:

libdrm-nouveau1a 2.4.33-3 i386
libgl1-mesa-dri 8.0.5-3 i386
libgl1-mesa-glx 8.0.5-3 i386
linux-image-3.2.0-4-686-pae 3.2.35-2 i386
xserver-xorg-video-nouveau 1:1.0.1-4 i386

The video card is:

NVIDIA Corporation NV11 [GeForce2 MX/MX 400] (rev a1)


It seems to me that this bug can be merged with:

<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nv20_state_fb.c:50: get_rt_format: Assertion `0' failed."
   href="show_bug.cgi?id=49148">https://bugs.freedesktop.org/show_bug.cgi?id=49148</a>

that contains also a patch.


This bug seems to affect some user, that filed these bug reports:

<a href="https://bugs.launchpad.net/ubuntu/+source/stellarium/+bug/1079011">https://bugs.launchpad.net/ubuntu/+source/stellarium/+bug/1079011</a>
<a href="https://bugzilla.redhat.com/show_bug.cgi?id=834329">https://bugzilla.redhat.com/show_bug.cgi?id=834329</a>


I hope to have the time to setup a build environment to test the patch on my
hardware, but in the meantime I wanted you to know about the situation.

Ciao</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1358034300.fc7eeebF1.22267--

--===============0071040890==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0071040890==--
