From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 37681] Tearing with composite extension
Date: Tue, 10 Dec 2013 04:28:24 +0000
Message-ID: <bug-37681-8800-tavsMjJCod@http.bugs.freedesktop.org/>
References: <bug-37681-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1889547036=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-37681-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1889547036==
Content-Type: multipart/alternative; boundary="1386649704.b3614704.30234"; charset="us-ascii"


--1386649704.b3614704.30234
Date: Tue, 10 Dec 2013 04:28:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=37681

--- Comment #5 from Joe <random342-EMRzualFZlQ@public.gmane.org> ---
Actually it's even worse on my end. Tearing does not go away on nouveau's
drivers no matter what I do. Even with compositing completely disabled, opengl
video output still tears. The best I can do is enable opengl compositing with
compton or something similiar and enable sync to Vblank, but there's still
tearing at the top of any fullscreen video even with opengl video output. I'm
on Arch with a Nvidia GTX 650. The tearing issue does not happen in the
proprietary drivers either. I hope this issue gets more attention as the
proprietary drivers have some other problems of their own for me.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1386649704.b3614704.30234
Date: Tue, 10 Dec 2013 04:28:24 +0000
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
   title="NEW --- - Tearing with composite extension"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=37681#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Tearing with composite extension"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=37681">bug 37681</a>
              from <span class="vcard"><a class="email" href="mailto:random342&#64;live.com" title="Joe &lt;random342&#64;live.com&gt;"> <span class="fn">Joe</span></a>
</span></b>
        <pre>Actually it's even worse on my end. Tearing does not go away on nouveau's
drivers no matter what I do. Even with compositing completely disabled, opengl
video output still tears. The best I can do is enable opengl compositing with
compton or something similiar and enable sync to Vblank, but there's still
tearing at the top of any fullscreen video even with opengl video output. I'm
on Arch with a Nvidia GTX 650. The tearing issue does not happen in the
proprietary drivers either. I hope this issue gets more attention as the
proprietary drivers have some other problems of their own for me.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1386649704.b3614704.30234--

--===============1889547036==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1889547036==--
