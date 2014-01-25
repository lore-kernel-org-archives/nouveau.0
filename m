From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73373] [NVE4] GPU lockup after opening many tabs in
 Chromium web browser
Date: Sat, 25 Jan 2014 19:01:24 +0000
Message-ID: <bug-73373-8800-ZG6guJFdlW@http.bugs.freedesktop.org/>
References: <bug-73373-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0662913928=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-73373-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0662913928==
Content-Type: multipart/alternative; boundary="1390676483.a7da0.11869"; charset="us-ascii"


--1390676483.a7da0.11869
Date: Sat, 25 Jan 2014 19:01:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73373

--- Comment #11 from Mario Barrera <mbarrera-KK0ffGbhmjU@public.gmane.org> ---
(In reply to comment #10)
> (In reply to comment #9)
> > Now I changed the option to nouveau.config=NvGrUseFW=1 and the graphics
> > freeze when the nouveau module loads apparently.
> 
> Any chance you can get logs when that happens? (e.g. by ssh'ing in, or
> perhaps they make it to some system log)
> 
> I assume that this is with the relevant nve4_* firmware files available in
> /lib/firmware/nouveau at nouveau module load time...

Indeed it seems there is a missing file. I attached the system logs.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390676483.a7da0.11869
Date: Sat, 25 Jan 2014 19:01:23 +0000
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
   title="NEW --- - [NVE4] GPU lockup after opening many tabs in Chromium web browser"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73373#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE4] GPU lockup after opening many tabs in Chromium web browser"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73373">bug 73373</a>
              from <span class="vcard"><a class="email" href="mailto:mbarrera&#64;gmx.com" title="Mario Barrera &lt;mbarrera&#64;gmx.com&gt;"> <span class="fn">Mario Barrera</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=73373#c10">comment #10</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=73373#c9">comment #9</a>)
&gt; &gt; Now I changed the option to nouveau.config=NvGrUseFW=1 and the graphics
&gt; &gt; freeze when the nouveau module loads apparently.
&gt; 
&gt; Any chance you can get logs when that happens? (e.g. by ssh'ing in, or
&gt; perhaps they make it to some system log)
&gt; 
&gt; I assume that this is with the relevant nve4_* firmware files available in
&gt; /lib/firmware/nouveau at nouveau module load time...</span >

Indeed it seems there is a missing file. I attached the system logs.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390676483.a7da0.11869--

--===============0662913928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0662913928==--
