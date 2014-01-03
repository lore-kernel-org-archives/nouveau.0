From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73267] Nouveau: corrupted laptop screen's EDID info
Date: Fri, 03 Jan 2014 21:23:54 +0000
Message-ID: <bug-73267-8800-6GrLH65X72@http.bugs.freedesktop.org/>
References: <bug-73267-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1097230133=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-73267-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1097230133==
Content-Type: multipart/alternative; boundary="1388784234.5EB52.21458"; charset="us-ascii"


--1388784234.5EB52.21458
Date: Fri, 3 Jan 2014 21:23:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73267

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
It appears that the correct values for the first 8 bytes are

00 ff ff ff ff ff ff 00

whereas you have them as

00 00 00 00 00 07 4f 00

(based on your earlier boots, and the last comment from bug 34554). Try to
stick the "correct" EDID into a file, and force its use via module options.
Take a look at

https://wiki.archlinux.org/index.php/Kernel_Mode_Setting#Forcing_modes_and_EDID

specifically, you need something like:

drm_kms_helper.edid_firmware=LVDS-1:edid/your_edid.bin

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1388784234.5EB52.21458
Date: Fri, 3 Jan 2014 21:23:54 +0000
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
   title="NEW --- - Nouveau: corrupted laptop screen's EDID info"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73267#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau: corrupted laptop screen's EDID info"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73267">bug 73267</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>It appears that the correct values for the first 8 bytes are

00 ff ff ff ff ff ff 00

whereas you have them as

00 00 00 00 00 07 4f 00

(based on your earlier boots, and the last comment from <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED INVALID - Nouveau seems to have corrupted my laptop screen's EDID info"
   href="show_bug.cgi?id=34554">bug 34554</a>). Try to
stick the &quot;correct&quot; EDID into a file, and force its use via module options.
Take a look at

<a href="https://wiki.archlinux.org/index.php/Kernel_Mode_Setting#Forcing_modes_and_EDID">https://wiki.archlinux.org/index.php/Kernel_Mode_Setting#Forcing_modes_and_EDID</a>

specifically, you need something like:

drm_kms_helper.edid_firmware=LVDS-1:edid/your_edid.bin</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1388784234.5EB52.21458--

--===============1097230133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1097230133==--
