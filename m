From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75761] weston-launch no output - black screen
Date: Thu, 10 Apr 2014 23:52:21 +0000
Message-ID: <bug-75761-8800-eGL1UaHz6u@http.bugs.freedesktop.org/>
References: <bug-75761-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1229718304=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75761-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1229718304==
Content-Type: multipart/alternative; boundary="1397173942.40cBaEDa4.29897"; charset="us-ascii"


--1397173942.40cBaEDa4.29897
Date: Thu, 10 Apr 2014 23:52:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75761

--- Comment #19 from Lubosz Sarnecki <lubosz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Reverting the patch on current Linux master
(4a4389abdd9822fdf3cc2ac6ed87eb811fd43acc) fixes the issue for me.

Apperently s->crtc needs to be hardcoded to -1 for the screen not to stay black
when launching weston.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1397173942.40cBaEDa4.29897
Date: Thu, 10 Apr 2014 23:52:22 +0000
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
   title="NEW --- - weston-launch no output - black screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75761#c19">Comment # 19</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - weston-launch no output - black screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75761">bug 75761</a>
              from <span class="vcard"><a class="email" href="mailto:lubosz&#64;gmail.com" title="Lubosz Sarnecki &lt;lubosz&#64;gmail.com&gt;"> <span class="fn">Lubosz Sarnecki</span></a>
</span></b>
        <pre>Reverting the patch on current Linux master
(4a4389abdd9822fdf3cc2ac6ed87eb811fd43acc) fixes the issue for me.

Apperently s-&gt;crtc needs to be hardcoded to -1 for the screen not to stay black
when launching weston.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1397173942.40cBaEDa4.29897--

--===============1229718304==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1229718304==--
