From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69827] [NVC1] Uneven, jerky mouse movement,
 increasing CPU usage
Date: Mon, 16 Nov 2015 22:59:11 +0000
Message-ID: <bug-69827-8800-b7HinTXjk3@http.bugs.freedesktop.org/>
References: <bug-69827-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0872747863=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69827-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0872747863==
Content-Type: multipart/alternative; boundary="1447714750.BB6EC2.12955"; charset="UTF-8"


--1447714750.BB6EC2.12955
Date: Mon, 16 Nov 2015 22:59:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69827

--- Comment #16 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to James Moe from comment #15)
> (In reply to Ilia Mirkin from comment #14)
> > > How do I use perf to monitor Gnome's CPU usage?
> > 
> > Well, presumably it's not "gnome" using CPU, it's some specific process. So
> > then you just do
> > 
> > perf record -g -p pid
> >
> Would I use "perf top" to identify suspect processes? Since I do not know
> which process is the problem, I cannot provide a PID for the "-p" option.

I've never used 'perf top' although it could perhaps be useful here. You could
identify the process with 'top'.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1447714750.BB6EC2.12955
Date: Mon, 16 Nov 2015 22:59:10 +0000
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
          bz_status_UNCONFIRMED "
   title="UNCONFIRMED - [NVC1] Uneven, jerky mouse movement, increasing CPU usage"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69827#c16">Comment # 16</a>
              on <a class="bz_bug_link 
          bz_status_UNCONFIRMED "
   title="UNCONFIRMED - [NVC1] Uneven, jerky mouse movement, increasing CPU usage"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69827">bug 69827</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to James Moe from <a href="show_bug.cgi?id=69827#c15">comment #15</a>)
<span class="quote">&gt; (In reply to Ilia Mirkin from <a href="show_bug.cgi?id=69827#c14">comment #14</a>)
&gt; &gt; &gt; How do I use perf to monitor Gnome's CPU usage?
&gt; &gt; 
&gt; &gt; Well, presumably it's not &quot;gnome&quot; using CPU, it's some specific process. So
&gt; &gt; then you just do
&gt; &gt; 
&gt; &gt; perf record -g -p pid
&gt; &gt;
&gt; Would I use &quot;perf top&quot; to identify suspect processes? Since I do not know
&gt; which process is the problem, I cannot provide a PID for the &quot;-p&quot; option.</span >

I've never used 'perf top' although it could perhaps be useful here. You could
identify the process with 'top'.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1447714750.BB6EC2.12955--

--===============0872747863==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0872747863==--
