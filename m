From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66809] Compiz segfault with latest mesa-git
Date: Sat, 13 Jul 2013 10:26:39 +0000
Message-ID: <bug-66809-8800-lFdTLQDcSa@http.bugs.freedesktop.org/>
References: <bug-66809-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0662502545=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-66809-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0662502545==
Content-Type: multipart/alternative; boundary="1373711199.1a136cf1.24943"; charset="us-ascii"


--1373711199.1a136cf1.24943
Date: Sat, 13 Jul 2013 10:26:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=66809

--- Comment #6 from Roy <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org> ---
Eric: Could you install the debugging symbols (or, if you compiled it yourself,
recompile with "-g" in your CFLAGS) for nouveau_dri and libdrm_nouveau please
and reproduce your crash, regenerating this backtrace? I think it would be
useful to see which function is trying to push the pushbuffer and what variable
is causing the segfault.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1373711199.1a136cf1.24943
Date: Sat, 13 Jul 2013 10:26:39 +0000
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
   title="NEW --- - Compiz segfault with latest mesa-git"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66809#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Compiz segfault with latest mesa-git"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66809">bug 66809</a>
              from <span class="vcard"><a class="email" href="mailto:r.spliet&#64;student.tudelft.nl" title="Roy &lt;r.spliet&#64;student.tudelft.nl&gt;"> <span class="fn">Roy</span></a>
</span></b>
        <pre>Eric: Could you install the debugging symbols (or, if you compiled it yourself,
recompile with &quot;-g&quot; in your CFLAGS) for nouveau_dri and libdrm_nouveau please
and reproduce your crash, regenerating this backtrace? I think it would be
useful to see which function is trying to push the pushbuffer and what variable
is causing the segfault.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1373711199.1a136cf1.24943--

--===============0662502545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0662502545==--
