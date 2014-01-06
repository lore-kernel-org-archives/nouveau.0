From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72943] [NV98] hangs in nvbios_init on probe (worked
	in 3.2)
Date: Mon, 06 Jan 2014 00:00:02 +0000
Message-ID: <bug-72943-8800-Yl8kUwuhSV@http.bugs.freedesktop.org/>
References: <bug-72943-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1812477879=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-72943-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1812477879==
Content-Type: multipart/alternative; boundary="1388966402.7FDCEa832.32113"; charset="us-ascii"


--1388966402.7FDCEa832.32113
Date: Mon, 6 Jan 2014 00:00:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=72943

--- Comment #9 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #7)
> Created attachment 91182 [details]
> syslog with debug=trace flag, more wait time to hit the disk
> 
> I think it hit the disk this time. the date is DEC25.

The only messages on Dec 25 are from 3.2. Perhaps you have a second computer
and can use netconsole to send the messages?

It'd be really useful to get a log with the trace since that should immediately
identify the failure.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1388966402.7FDCEa832.32113
Date: Mon, 6 Jan 2014 00:00:02 +0000
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
   title="NEW --- - [NV98] hangs in nvbios_init on probe (worked in 3.2)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72943#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV98] hangs in nvbios_init on probe (worked in 3.2)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72943">bug 72943</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=72943#c7">comment #7</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=91182" name="attach_91182" title="syslog with debug=trace flag, more wait time to hit the disk">attachment 91182</a> <a href="attachment.cgi?id=91182&amp;action=edit" title="syslog with debug=trace flag, more wait time to hit the disk">[details]</a></span>
&gt; syslog with debug=trace flag, more wait time to hit the disk
&gt; 
&gt; I think it hit the disk this time. the date is DEC25.</span >

The only messages on Dec 25 are from 3.2. Perhaps you have a second computer
and can use netconsole to send the messages?

It'd be really useful to get a log with the trace since that should immediately
identify the failure.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1388966402.7FDCEa832.32113--

--===============1812477879==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1812477879==--
