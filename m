From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78092] GK208M [GeForce GT 730M] (rev ff) (prog-if
 ff) nouveau module load fail
Date: Tue, 29 Apr 2014 19:13:40 +0000
Message-ID: <bug-78092-8800-XdmvlQrkRi@http.bugs.freedesktop.org/>
References: <bug-78092-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2107843599=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-78092-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2107843599==
Content-Type: multipart/alternative; boundary="1398798819.ABE8a81.1093"; charset="us-ascii"


--1398798819.ABE8a81.1093
Date: Tue, 29 Apr 2014 19:13:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78092

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
You should avoid bumblebee on recent kernels if you want to use nouveau.
Nouveau  should now (as of 3.12 or 3.13, iirc) auto-suspend when not in use
(assuming that it loads :) ). The first thing I'd do is get rid of bumblebee.

I'm pretty sure this isn't your problem, since it should be getting detected as
an optimus system, but perhaps something like
http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=2677c8889a40d7404cc8fc9210cb59fdf95efa63
would help. Or the vbios should be read from PROM but it's hitting the issue
that keplers don't support 8-bit reads from PROM (which should be addressed in
3.15-rc1+), see
http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=6b6d97553de21cf3f7b3b7fe7e57a16ac41ee2ac
.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1398798819.ABE8a81.1093
Date: Tue, 29 Apr 2014 19:13:39 +0000
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
   title="NEW --- - GK208M [GeForce GT 730M] (rev ff) (prog-if ff) nouveau module load fail"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78092#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - GK208M [GeForce GT 730M] (rev ff) (prog-if ff) nouveau module load fail"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78092">bug 78092</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>You should avoid bumblebee on recent kernels if you want to use nouveau.
Nouveau  should now (as of 3.12 or 3.13, iirc) auto-suspend when not in use
(assuming that it loads :) ). The first thing I'd do is get rid of bumblebee.

I'm pretty sure this isn't your problem, since it should be getting detected as
an optimus system, but perhaps something like
<a href="http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=2677c8889a40d7404cc8fc9210cb59fdf95efa63">http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=2677c8889a40d7404cc8fc9210cb59fdf95efa63</a>
would help. Or the vbios should be read from PROM but it's hitting the issue
that keplers don't support 8-bit reads from PROM (which should be addressed in
3.15-rc1+), see
<a href="http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=6b6d97553de21cf3f7b3b7fe7e57a16ac41ee2ac">http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=6b6d97553de21cf3f7b3b7fe7e57a16ac41ee2ac</a>
.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1398798819.ABE8a81.1093--

--===============2107843599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2107843599==--
