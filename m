From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 85471] [NV86] nouveau/kernel 3.18.0-rc1: nouveau
 deadlocks on 2nd Xorg start or reboot
Date: Sun, 26 Oct 2014 11:01:48 +0000
Message-ID: <bug-85471-8800-E3ABffmuTs@http.bugs.freedesktop.org/>
References: <bug-85471-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0700213199=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-85471-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0700213199==
Content-Type: multipart/alternative; boundary="1414321307.3A1e1EDe1.29198"; charset="UTF-8"


--1414321307.3A1e1EDe1.29198
Date: Sun, 26 Oct 2014 11:01:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=85471

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Seems like you're being hit by runtime pm somehow... Can you confirm by booting
with

nouveau.runpm=0

to see if that resolves your issues? runpm was new in kernel 3.12 iirc (for
nouveau).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1414321307.3A1e1EDe1.29198
Date: Sun, 26 Oct 2014 11:01:47 +0000
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
   title="NEW - [NV86] nouveau/kernel 3.18.0-rc1: nouveau deadlocks on 2nd Xorg start or reboot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85471#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV86] nouveau/kernel 3.18.0-rc1: nouveau deadlocks on 2nd Xorg start or reboot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85471">bug 85471</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Seems like you're being hit by runtime pm somehow... Can you confirm by booting
with

nouveau.runpm=0

to see if that resolves your issues? runpm was new in kernel 3.12 iirc (for
nouveau).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1414321307.3A1e1EDe1.29198--

--===============0700213199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0700213199==--
