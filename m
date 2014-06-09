From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79823] [NV30/gallium] Mozilla apps freeze on startup
 with nouveau-dri-10.2.1 libs on dual-screen
Date: Mon, 09 Jun 2014 16:14:23 +0000
Message-ID: <bug-79823-8800-XimrK9IpUS@http.bugs.freedesktop.org/>
References: <bug-79823-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1480653688=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-79823-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1480653688==
Content-Type: multipart/alternative; boundary="1402330462.1AF3fafE0.9211"; charset="us-ascii"


--1402330462.1AF3fafE0.9211
Date: Mon, 9 Jun 2014 16:14:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79823

--- Comment #5 from Natrio <natrio-cmBhpYW9OiY@public.gmane.org> ---
(In reply to comment #3)
> strace log is not that useful. It's probably sitting around waiting for
> something to happen, which never happens. Bisecting is fairly easy... there
> are a bunch of guides online. I'd recommend installing into some scratch
> location and using LD_LIBRARY_PATH to pick up your new lib, so that you
> don't mess up your system install.
It's not exactly "sitting around and waiting", it cycling around (up to 100%
CPU used) and keeps repeating the same action, probably with nouveau-dri
library.

(In reply to comment #4)
> Oh, and you can find some build instructions at
> http://nouveau.freedesktop.org/wiki/InstallNouveau/#mesa
Thank you, I will try to do it.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1402330462.1AF3fafE0.9211
Date: Mon, 9 Jun 2014 16:14:22 +0000
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
   title="NEW --- - [NV30/gallium] Mozilla apps freeze on startup with nouveau-dri-10.2.1 libs on dual-screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79823#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV30/gallium] Mozilla apps freeze on startup with nouveau-dri-10.2.1 libs on dual-screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79823">bug 79823</a>
              from <span class="vcard"><a class="email" href="mailto:natrio&#64;list.ru" title="Natrio &lt;natrio&#64;list.ru&gt;"> <span class="fn">Natrio</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=79823#c3">comment #3</a>)
<span class="quote">&gt; strace log is not that useful. It's probably sitting around waiting for
&gt; something to happen, which never happens. Bisecting is fairly easy... there
&gt; are a bunch of guides online. I'd recommend installing into some scratch
&gt; location and using LD_LIBRARY_PATH to pick up your new lib, so that you
&gt; don't mess up your system install.</span >
It's not exactly &quot;sitting around and waiting&quot;, it cycling around (up to 100%
CPU used) and keeps repeating the same action, probably with nouveau-dri
library.

(In reply to <a href="show_bug.cgi?id=79823#c4">comment #4</a>)
<span class="quote">&gt; Oh, and you can find some build instructions at
&gt; <a href="http://nouveau.freedesktop.org/wiki/InstallNouveau/#mesa">http://nouveau.freedesktop.org/wiki/InstallNouveau/#mesa</a></span >
Thank you, I will try to do it.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1402330462.1AF3fafE0.9211--

--===============1480653688==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1480653688==--
