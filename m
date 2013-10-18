From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70388] [NV34] failed to idle channel 0xcccc0000
Date: Fri, 18 Oct 2013 18:57:06 +0000
Message-ID: <bug-70388-8800-wq04nUkMz5@http.bugs.freedesktop.org/>
References: <bug-70388-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1854363566=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70388-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1854363566==
Content-Type: multipart/alternative; boundary="1382122626.cF8f730.31529"; charset="us-ascii"


--1382122626.cF8f730.31529
Date: Fri, 18 Oct 2013 18:57:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70388

--- Comment #9 from Rostislav Krasny <rosti.bsd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #8)
> Depending on circumstances, you might find it in /var/log/messages, or if
> you can ssh in while the machine is "hung", just run dmesg, or if you can't,
> set up netconsole.

The /var/log/messages contains the same output to that of journalctl.
journalctl is the systemd way of working with the system logs.

dmesg also doesn't have much information about this crash. I will attach a
dmesg2.txt and a journalctl2.txt files in the next messages.

The nouveau Bugs wiki (http://nouveau.freedesktop.org/wiki/Bugs/) suggests to
add log_buf_len=1M into the kernel parameters. But I doubt it would help in my
case, would it? Maybe there is some other kernel/mesa parameter that will
change the log level to something more informative?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1382122626.cF8f730.31529
Date: Fri, 18 Oct 2013 18:57:06 +0000
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
   title="NEW --- - [NV34] failed to idle channel 0xcccc0000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70388#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV34] failed to idle channel 0xcccc0000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70388">bug 70388</a>
              from <span class="vcard"><a class="email" href="mailto:rosti.bsd&#64;gmail.com" title="Rostislav Krasny &lt;rosti.bsd&#64;gmail.com&gt;"> <span class="fn">Rostislav Krasny</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=70388#c8">comment #8</a>)
<span class="quote">&gt; Depending on circumstances, you might find it in /var/log/messages, or if
&gt; you can ssh in while the machine is &quot;hung&quot;, just run dmesg, or if you can't,
&gt; set up netconsole.</span >

The /var/log/messages contains the same output to that of journalctl.
journalctl is the systemd way of working with the system logs.

dmesg also doesn't have much information about this crash. I will attach a
dmesg2.txt and a journalctl2.txt files in the next messages.

The nouveau Bugs wiki (<a href="http://nouveau.freedesktop.org/wiki/Bugs/">http://nouveau.freedesktop.org/wiki/Bugs/</a>) suggests to
add log_buf_len=1M into the kernel parameters. But I doubt it would help in my
case, would it? Maybe there is some other kernel/mesa parameter that will
change the log level to something more informative?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1382122626.cF8f730.31529--

--===============1854363566==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1854363566==--
