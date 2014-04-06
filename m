From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77102] gallium nouveau has no profile in vdpau and
	libva
Date: Sun, 06 Apr 2014 18:40:13 +0000
Message-ID: <bug-77102-8800-vSzD2x79ek@http.bugs.freedesktop.org/>
References: <bug-77102-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0997896658=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77102-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0997896658==
Content-Type: multipart/alternative; boundary="1396809612.4bB31.17100"; charset="us-ascii"


--1396809612.4bB31.17100
Date: Sun, 6 Apr 2014 18:40:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77102

--- Comment #8 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
OK, so it seems like the firmware is correctly in place, and there are no
errors coming from dmesg, which means it's getting loaded (or at least isn't
failing to load).

What version of Mesa are you using? I recently added a feature which
auto-detects if firmware is present before reporting codec capabilities, and I
might have gotten it wrong somehow.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1396809612.4bB31.17100
Date: Sun, 6 Apr 2014 18:40:12 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - gallium nouveau has no profile in vdpau and libva"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77102#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - gallium nouveau has no profile in vdpau and libva"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77102">bug 77102</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>OK, so it seems like the firmware is correctly in place, and there are no
errors coming from dmesg, which means it's getting loaded (or at least isn't
failing to load).

What version of Mesa are you using? I recently added a feature which
auto-detects if firmware is present before reporting codec capabilities, and I
might have gotten it wrong somehow.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1396809612.4bB31.17100--

--===============0997896658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0997896658==--
