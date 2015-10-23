From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 63051] Displist with multiple OpenGL contexts
	crashes.
Date: Fri, 23 Oct 2015 08:11:30 +0000
Message-ID: <bug-63051-8800-NuBuCbgjtE@http.bugs.freedesktop.org/>
References: <bug-63051-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1688257218=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-63051-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1688257218==
Content-Type: multipart/alternative; boundary="1445587890.5BfC050.29690"; charset="UTF-8"


--1445587890.5BfC050.29690
Date: Fri, 23 Oct 2015 08:11:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=63051

--- Comment #3 from Campbell Barton <ideasman42-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Confirm this is fixed,

renderer:    'Gallium 0.4 on NVC3'
vendor:        'nouveau'
version:    '3.0 Mesa 11.0.3'

(tested with Blender 2.76).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1445587890.5BfC050.29690
Date: Fri, 23 Oct 2015 08:11:30 +0000
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
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - Displist with multiple OpenGL contexts crashes."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63051#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - Displist with multiple OpenGL contexts crashes."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63051">bug 63051</a>
              from <span class="vcard"><a class="email" href="mailto:ideasman42&#64;gmail.com" title="Campbell Barton &lt;ideasman42&#64;gmail.com&gt;"> <span class="fn">Campbell Barton</span></a>
</span></b>
        <pre>Confirm this is fixed,

renderer:    'Gallium 0.4 on NVC3'
vendor:        'nouveau'
version:    '3.0 Mesa 11.0.3'

(tested with Blender 2.76).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1445587890.5BfC050.29690--

--===============1688257218==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1688257218==--
