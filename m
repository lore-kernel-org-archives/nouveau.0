From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80266] Undefined operation in tgsi_ureg.c left shift
 of 1 by 31 places cannot be represented in type 'int'
Date: Fri, 20 Jun 2014 11:53:07 +0000
Message-ID: <bug-80266-8800-LBfCgcZoWV@http.bugs.freedesktop.org/>
References: <bug-80266-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1471211084=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-80266-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1471211084==
Content-Type: multipart/alternative; boundary="1403265187.EcBAA7450.8765"; charset="us-ascii"


--1403265187.EcBAA7450.8765
Date: Fri, 20 Jun 2014 11:53:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80266

--- Comment #3 from Vittorio <zeccav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
For the same reason I believe that in uniforms.c:79
"if (prog->SamplersUsed & (1 << s)) {" should be
"if (prog->SamplersUsed & (1U << s)) {".
This is running glxgears.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1403265187.EcBAA7450.8765
Date: Fri, 20 Jun 2014 11:53:07 +0000
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
   title="NEW --- - Undefined operation in tgsi_ureg.c left shift of 1 by 31 places cannot be represented in type 'int'"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80266#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Undefined operation in tgsi_ureg.c left shift of 1 by 31 places cannot be represented in type 'int'"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80266">bug 80266</a>
              from <span class="vcard"><a class="email" href="mailto:zeccav&#64;gmail.com" title="Vittorio &lt;zeccav&#64;gmail.com&gt;"> <span class="fn">Vittorio</span></a>
</span></b>
        <pre>For the same reason I believe that in uniforms.c:79
&quot;if (prog-&gt;SamplersUsed &amp; (1 &lt;&lt; s)) {&quot; should be
&quot;if (prog-&gt;SamplersUsed &amp; (1U &lt;&lt; s)) {&quot;.
This is running glxgears.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1403265187.EcBAA7450.8765--

--===============1471211084==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1471211084==--
