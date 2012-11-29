From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 57660] nv?? show error nv??_screen_get_param:??? -
 unknown PIPE_CAP 76
Date: Thu, 29 Nov 2012 17:27:11 +0000
Message-ID: <bug-57660-8800-IH11DOmlhH@http.bugs.freedesktop.org/>
References: <bug-57660-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0966949995=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-57660-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0966949995==
Content-Type: multipart/alternative; boundary="1354210031.4037faFc0.1978"; charset="us-ascii"


--1354210031.4037faFc0.1978
Date: Thu, 29 Nov 2012 17:27:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=57660

--- Comment #3 from Hristo Venev <mustrumr97-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
In nv50_ir_lowering_nv50.cpp in handleTEX, arguments to the texture instruction
i are (x, y, z, face, something).
What do they need to be transformed to? Is it (x, y, 6*z+face, something)?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1354210031.4037faFc0.1978
Date: Thu, 29 Nov 2012 17:27:11 +0000
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
   title="NEW --- - nv?? show error nv??_screen_get_param:??? - unknown PIPE_CAP 76"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57660#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nv?? show error nv??_screen_get_param:??? - unknown PIPE_CAP 76"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57660">bug 57660</a>
              from <span class="vcard"><a class="email" href="mailto:mustrumr97&#64;gmail.com" title="Hristo Venev &lt;mustrumr97&#64;gmail.com&gt;"> <span class="fn">Hristo Venev</span></a>
</span></b>
        <pre>In nv50_ir_lowering_nv50.cpp in handleTEX, arguments to the texture instruction
i are (x, y, z, face, something).
What do they need to be transformed to? Is it (x, y, 6*z+face, something)?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1354210031.4037faFc0.1978--

--===============0966949995==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0966949995==--
