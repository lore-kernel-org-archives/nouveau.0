From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68768] [NV92] PTHERM unhandled intr error during boot
Date: Fri, 30 Aug 2013 19:44:49 +0000
Message-ID: <bug-68768-8800-ezPwJtIxa9@http.bugs.freedesktop.org/>
References: <bug-68768-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0092559129=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-68768-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0092559129==
Content-Type: multipart/alternative; boundary="1377891889.c7Be551.1022"; charset="us-ascii"


--1377891889.c7Be551.1022
Date: Fri, 30 Aug 2013 19:44:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=68768

--- Comment #6 from mattia.b89 <mattia.b89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #5)
> (In reply to comment #3)
> > [    8.796597] nouveau  [  PTHERM][0000:01:00.0] fan management: disabled
> > 
> > If you want to enable it, take a look at
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/
> > Documentation/thermal/nouveau_thermal
> 
> Oh, and for now, mattia.b89 will need to set the kernel parameter
> nouveau.perflvl=7777.

to activate the fan management?

I see a mistake in the documentation: "Celcius" should be "Celsius"

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377891889.c7Be551.1022
Date: Fri, 30 Aug 2013 19:44:49 +0000
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
   title="NEW --- - [NV92] PTHERM unhandled intr error during boot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68768#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV92] PTHERM unhandled intr error during boot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68768">bug 68768</a>
              from <span class="vcard"><a class="email" href="mailto:mattia.b89&#64;gmail.com" title="mattia.b89 &lt;mattia.b89&#64;gmail.com&gt;"> <span class="fn">mattia.b89</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=68768#c5">comment #5</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=68768#c3">comment #3</a>)
&gt; &gt; [    8.796597] nouveau  [  PTHERM][0000:01:00.0] fan management: disabled
&gt; &gt; 
&gt; &gt; If you want to enable it, take a look at
&gt; &gt; <a href="https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/">https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/</a>
&gt; &gt; Documentation/thermal/nouveau_thermal
&gt; 
&gt; Oh, and for now, mattia.b89 will need to set the kernel parameter
&gt; nouveau.perflvl=7777.</span >

to activate the fan management?

I see a mistake in the documentation: &quot;Celcius&quot; should be &quot;Celsius&quot;</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377891889.c7Be551.1022--

--===============0092559129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0092559129==--
