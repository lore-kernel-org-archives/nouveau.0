From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64774] nouveau GF108 kernel crash in optimus mode
 when enabling external display output
Date: Wed, 21 Aug 2013 17:03:59 +0000
Message-ID: <bug-64774-8800-mR6YOu5KUN@http.bugs.freedesktop.org/>
References: <bug-64774-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0116063528=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-64774-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0116063528==
Content-Type: multipart/alternative; boundary="1377104639.edbe1f6f2.24645"; charset="us-ascii"


--1377104639.edbe1f6f2.24645
Date: Wed, 21 Aug 2013 17:03:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=64774

--- Comment #22 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
We should figure out why it's getting stuff that it doesn't expect. I had
suggested adding the warn solely to avoid the crash down the line. I guess it's
reasonable for the upstream kernel to have that, as if it ever fires, we're
going to be in trouble later... I think. Will have to re-check the code. I can
post it with my analysis if you like, or you can.

Could you retest this with 3.11-rc6 BTW? The whole fb pinning/etc logic was
reworked, and your issue may have been fixed by it.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377104639.edbe1f6f2.24645
Date: Wed, 21 Aug 2013 17:03:59 +0000
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
   title="NEW --- - nouveau GF108 kernel crash in optimus mode when enabling external display output"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64774#c22">Comment # 22</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau GF108 kernel crash in optimus mode when enabling external display output"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64774">bug 64774</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>We should figure out why it's getting stuff that it doesn't expect. I had
suggested adding the warn solely to avoid the crash down the line. I guess it's
reasonable for the upstream kernel to have that, as if it ever fires, we're
going to be in trouble later... I think. Will have to re-check the code. I can
post it with my analysis if you like, or you can.

Could you retest this with 3.11-rc6 BTW? The whole fb pinning/etc logic was
reworked, and your issue may have been fixed by it.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377104639.edbe1f6f2.24645--

--===============0116063528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0116063528==--
