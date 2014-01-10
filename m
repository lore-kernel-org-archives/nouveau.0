From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73459] nv10 get_rt_format: Assertion `0' failed.
Date: Fri, 10 Jan 2014 08:10:58 +0000
Message-ID: <bug-73459-8800-8GMooviK8x@http.bugs.freedesktop.org/>
References: <bug-73459-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1930113143=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-73459-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1930113143==
Content-Type: multipart/alternative; boundary="1389341458.7Cf8E71.6477"; charset="us-ascii"


--1389341458.7Cf8E71.6477
Date: Fri, 10 Jan 2014 08:10:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73459

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Created attachment 91807
  --> https://bugs.freedesktop.org/attachment.cgi?id=91807&action=edit
implement buffer validation callback

Well, this "fixes" your test program. I haven't really tested whether this
actually ever works... but give it a shot.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389341458.7Cf8E71.6477
Date: Fri, 10 Jan 2014 08:10:58 +0000
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
   title="NEW --- - nv10 get_rt_format: Assertion `0' failed."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73459#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nv10 get_rt_format: Assertion `0' failed."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73459">bug 73459</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=91807" name="attach_91807" title="implement buffer validation callback">attachment 91807</a> <a href="attachment.cgi?id=91807&amp;action=edit" title="implement buffer validation callback">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=73459&amp;attachment=91807'>[review]</a>
implement buffer validation callback

Well, this &quot;fixes&quot; your test program. I haven't really tested whether this
actually ever works... but give it a shot.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389341458.7Cf8E71.6477--

--===============1930113143==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1930113143==--
