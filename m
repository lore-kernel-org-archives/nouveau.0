From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77599] Video failed on resume from suspend - G94 /
 GeForce 9600 GT, 10de:0622
Date: Thu, 22 May 2014 16:58:11 +0000
Message-ID: <bug-77599-8800-5zeCfwhviU@http.bugs.freedesktop.org/>
References: <bug-77599-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1770528295=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77599-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1770528295==
Content-Type: multipart/alternative; boundary="1400777891.eFdfc5f81.25092"; charset="us-ascii"


--1400777891.eFdfc5f81.25092
Date: Thu, 22 May 2014 16:58:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77599

--- Comment #6 from Adam Williamson <awilliam-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> ---
it's also not 'nicely' reproducible for bisection purposes :/ just booting the
system, quickly suspending, and quickly resuming almost never seems to trigger
it. it seems to happen much more often when you do a 'production' suspend -
really use the system for a while, then suspend, walk away, come back a few
hours later and resume. which isn't exactly great for doing a bisect.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1400777891.eFdfc5f81.25092
Date: Thu, 22 May 2014 16:58:11 +0000
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
   title="NEW --- - Video failed on resume from suspend - G94 / GeForce 9600 GT, 10de:0622"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77599#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Video failed on resume from suspend - G94 / GeForce 9600 GT, 10de:0622"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77599">bug 77599</a>
              from <span class="vcard"><a class="email" href="mailto:awilliam&#64;redhat.com" title="Adam Williamson &lt;awilliam&#64;redhat.com&gt;"> <span class="fn">Adam Williamson</span></a>
</span></b>
        <pre>it's also not 'nicely' reproducible for bisection purposes :/ just booting the
system, quickly suspending, and quickly resuming almost never seems to trigger
it. it seems to happen much more often when you do a 'production' suspend -
really use the system for a while, then suspend, walk away, come back a few
hours later and resume. which isn't exactly great for doing a bisect.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1400777891.eFdfc5f81.25092--

--===============1770528295==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1770528295==--
