From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 51798] Cannot enable second video card on nvidia
	quadro NVS420
Date: Fri, 30 Aug 2013 18:02:26 +0000
Message-ID: <bug-51798-8800-AQzAOQtIUN@http.bugs.freedesktop.org/>
References: <bug-51798-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1806619335=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-51798-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1806619335==
Content-Type: multipart/alternative; boundary="1377885745.14D02.14413"; charset="us-ascii"


--1377885745.14D02.14413
Date: Fri, 30 Aug 2013 18:02:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=51798

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
BTW2: It has been noticed that the second gpu's outputs are not going to be
enabled since 3.7 unless you use nouveau.modeset=1. This will hopefully be
fixed in a future kernel though. When re-resting, please use that option on the
kernel commandline. Lastly, a fix went into xf86-video-nouveau 1.0.8 for a bug
that caused the second GPU to never be used by X on those cards, so make sure
you upgrade to at least that version.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377885745.14D02.14413
Date: Fri, 30 Aug 2013 18:02:25 +0000
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
   title="NEW --- - Cannot enable second video card on nvidia quadro NVS420"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51798#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Cannot enable second video card on nvidia quadro NVS420"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51798">bug 51798</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>BTW2: It has been noticed that the second gpu's outputs are not going to be
enabled since 3.7 unless you use nouveau.modeset=1. This will hopefully be
fixed in a future kernel though. When re-resting, please use that option on the
kernel commandline. Lastly, a fix went into xf86-video-nouveau 1.0.8 for a bug
that caused the second GPU to never be used by X on those cards, so make sure
you upgrade to at least that version.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377885745.14D02.14413--

--===============1806619335==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1806619335==--
