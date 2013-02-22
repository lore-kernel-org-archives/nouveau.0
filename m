From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59168] [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic
 garbage/corruption/noise on resume
Date: Fri, 22 Feb 2013 01:06:54 +0000
Message-ID: <bug-59168-8800-tUpKC4pz1R@http.bugs.freedesktop.org/>
References: <bug-59168-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1088907699=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59168-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1088907699==
Content-Type: multipart/alternative; boundary="1361495214.7bf76cB44.20942"; charset="us-ascii"


--1361495214.7bf76cB44.20942
Date: Fri, 22 Feb 2013 01:06:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59168

--- Comment #23 from Tom Callaway <tcallawa-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> ---
(In reply to comment #13)
> Created attachment 75129 [details] [review]
> fix suspend bug in nvc0 fence implementation
> 
> Guys, try this patch by Maarten Lankhorst.

Tried that patch with git head 3.9, suspend still comes back to garbage + mouse
cursor, dmesg logs are filled with this, repeating endlessly:

[  302.118755] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa0040a1e
[  302.119858] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000]
[  302.120869] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa0040a1e
[  302.121951] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000]
[  302.122961] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e
[  302.126800] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000]
[  302.127434] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa0040a1e
[  302.128113] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000]
[  302.128726] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e
[  314.138071] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000]
[  314.145020] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa0040a1e
[  314.146127] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000]
[  314.147142] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa0040a1e
[  314.148232] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000]
[  314.149266] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e
[  314.153112] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000]
[  314.153780] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa0040a1e
[  314.154518] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000]
[  314.155163] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e
[  314.155873] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000]
[  314.156526] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e
[  314.158712] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000]
[  314.159432] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa0040a1e
[  314.160207] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000]
[  314.160919] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e
[  314.160995] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000]
[  314.161001] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e
[  314.164003] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000]
[  314.164622] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa0040a1e
[  314.165791] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000]
[  314.166415] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e
[  314.167099] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000]
[  314.167713] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e
[  314.168395] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000]
[  314.169017] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1361495214.7bf76cB44.20942
Date: Fri, 22 Feb 2013 01:06:54 +0000
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
   title="NEW --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168#c23">Comment # 23</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168">bug 59168</a>
              from <span class="vcard"><a class="email" href="mailto:tcallawa&#64;redhat.com" title="Tom Callaway &lt;tcallawa&#64;redhat.com&gt;"> <span class="fn">Tom Callaway</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=59168#c13">comment #13</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=75129" name="attach_75129" title="fix suspend bug in nvc0 fence implementation">attachment 75129</a> <a href="attachment.cgi?id=75129&amp;action=edit" title="fix suspend bug in nvc0 fence implementation">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=59168&amp;attachment=75129'>[review]</a> [review]
&gt; fix suspend bug in nvc0 fence implementation
&gt; 
&gt; Guys, try this patch by Maarten Lankhorst.</span >

Tried that patch with git head 3.9, suspend still comes back to garbage + mouse
cursor, dmesg logs are filled with this, repeating endlessly:

[  302.118755] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa0040a1e
[  302.119858] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000]
[  302.120869] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa0040a1e
[  302.121951] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000]
[  302.122961] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e
[  302.126800] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000]
[  302.127434] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa0040a1e
[  302.128113] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000]
[  302.128726] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e
[  314.138071] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000]
[  314.145020] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa0040a1e
[  314.146127] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000]
[  314.147142] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa0040a1e
[  314.148232] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000]
[  314.149266] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e
[  314.153112] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000]
[  314.153780] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa0040a1e
[  314.154518] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000]
[  314.155163] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e
[  314.155873] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000]
[  314.156526] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e
[  314.158712] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000]
[  314.159432] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa0040a1e
[  314.160207] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000]
[  314.160919] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e
[  314.160995] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000]
[  314.161001] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e
[  314.164003] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000]
[  314.164622] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa0040a1e
[  314.165791] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000]
[  314.166415] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e
[  314.167099] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000]
[  314.167713] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e
[  314.168395] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x003fe10000]
[  314.169017] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1361495214.7bf76cB44.20942--

--===============1088907699==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1088907699==--
