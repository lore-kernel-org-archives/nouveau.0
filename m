From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80506] Video failed on resume from suspend - G94 /
 GeForce 9600 GT, 10de:0622 , kernel 3.16 rc2
Date: Wed, 25 Jun 2014 01:19:08 +0000
Message-ID: <bug-80506-8800-fCATXpRdvr@http.bugs.freedesktop.org/>
References: <bug-80506-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1559252097=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-80506-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1559252097==
Content-Type: multipart/alternative; boundary="1403659148.F7fBd1D1.2385"; charset="us-ascii"


--1403659148.F7fBd1D1.2385
Date: Wed, 25 Jun 2014 01:19:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80506

--- Comment #2 from Adam Williamson <awilliam-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> ---
Created attachment 101709
  --> https://bugs.freedesktop.org/attachment.cgi?id=101709&action=edit
drm.debug=14 log: boot at 18:01, suspend at 18:02, resume at 18:03

Ben asked for a drm.debug=14 log (apparently 15 is too noisy), so here you go.
Boot is at 18:01, suspend is at 18:02, resume is at 18:03 (obviously some early
post-resume messages may be mis-timestamped, those were the actual real-world
times when I pushed the buttons.)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1403659148.F7fBd1D1.2385
Date: Wed, 25 Jun 2014 01:19:08 +0000
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
   title="NEW --- - Video failed on resume from suspend - G94 / GeForce 9600 GT, 10de:0622 , kernel 3.16 rc2"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80506#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Video failed on resume from suspend - G94 / GeForce 9600 GT, 10de:0622 , kernel 3.16 rc2"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80506">bug 80506</a>
              from <span class="vcard"><a class="email" href="mailto:awilliam&#64;redhat.com" title="Adam Williamson &lt;awilliam&#64;redhat.com&gt;"> <span class="fn">Adam Williamson</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=101709" name="attach_101709" title="drm.debug=14 log: boot at 18:01, suspend at 18:02, resume at 18:03">attachment 101709</a> <a href="attachment.cgi?id=101709&amp;action=edit" title="drm.debug=14 log: boot at 18:01, suspend at 18:02, resume at 18:03">[details]</a></span>
drm.debug=14 log: boot at 18:01, suspend at 18:02, resume at 18:03

Ben asked for a drm.debug=14 log (apparently 15 is too noisy), so here you go.
Boot is at 18:01, suspend is at 18:02, resume is at 18:03 (obviously some early
post-resume messages may be mis-timestamped, those were the actual real-world
times when I pushed the buttons.)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1403659148.F7fBd1D1.2385--

--===============1559252097==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1559252097==--
