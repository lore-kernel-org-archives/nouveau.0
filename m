From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78543] NV28M running at 1/8th GPU clock when using
	nouveau
Date: Sat, 10 May 2014 23:34:15 +0000
Message-ID: <bug-78543-8800-AV07PTGd52@http.bugs.freedesktop.org/>
References: <bug-78543-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1033529123=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-78543-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1033529123==
Content-Type: multipart/alternative; boundary="1399764854.F6BFd1.637"; charset="us-ascii"


--1399764854.F6BFd1.637
Date: Sat, 10 May 2014 23:34:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78543

--- Comment #2 from nv28m <nv28m-Y8qEzhMunLyT9ig0jae3mg@public.gmane.org> ---
I've made more testing. It looks like the modesetting driver is unaffected of
GPU performance and because of this it's running better when the GPU is in slow
mode.

I've tried nouveau with noaccel, this smoothed scrolling (when the GPU is
running slow), but other 2D operations were still slower than with the
modesetting driver.

So, going with the modesetting driver is not a bad option at this time (as I
don't use much 3D), but it lacks XV support ;( It would be nice to fix this
slow GPU problem somehow and then I could use nouveau.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1399764854.F6BFd1.637
Date: Sat, 10 May 2014 23:34:14 +0000
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
   title="NEW --- - NV28M running at 1/8th GPU clock when using nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78543#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - NV28M running at 1/8th GPU clock when using nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78543">bug 78543</a>
              from <span class="vcard"><a class="email" href="mailto:nv28m&#64;freemail.hu" title="nv28m &lt;nv28m&#64;freemail.hu&gt;"> <span class="fn">nv28m</span></a>
</span></b>
        <pre>I've made more testing. It looks like the modesetting driver is unaffected of
GPU performance and because of this it's running better when the GPU is in slow
mode.

I've tried nouveau with noaccel, this smoothed scrolling (when the GPU is
running slow), but other 2D operations were still slower than with the
modesetting driver.

So, going with the modesetting driver is not a bad option at this time (as I
don't use much 3D), but it lacks XV support ;( It would be nice to fix this
slow GPU problem somehow and then I could use nouveau.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1399764854.F6BFd1.637--

--===============1033529123==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1033529123==--
