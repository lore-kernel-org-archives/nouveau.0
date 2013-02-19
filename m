From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59168] [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic
 garbage/corruption/noise on resume
Date: Tue, 19 Feb 2013 21:58:27 +0000
Message-ID: <bug-59168-8800-TxV1CCBOD2@http.bugs.freedesktop.org/>
References: <bug-59168-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1603939015=="
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


--===============1603939015==
Content-Type: multipart/alternative; boundary="1361311108.6cc0D75.10820"; charset="us-ascii"


--1361311108.6cc0D75.10820
Date: Tue, 19 Feb 2013 21:58:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59168

--- Comment #18 from Petr Stastny <p.stastny-Mmb7MZpHnFY@public.gmane.org> ---
Ok, that must be my mistake. lspci says:

01:00.0 VGA compatible controller: NVIDIA Corporation GF106GLM [Quadro 2000M]
(rev a1)

yes, I have a Thinkpad W520

(In reply to comment #17)
> You cannot have nv30 card (produced ~8 years ago) in 1-2 years old laptop.
> That would be insane. If "w520" (which I assume is ThinkPad W520) was
> mentioned as a mistake, then please open new bug report.
> 
> http://nouveau.freedesktop.org/wiki/Bugs
> http://nouveau.freedesktop.org/wiki/CodeNames

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1361311108.6cc0D75.10820
Date: Tue, 19 Feb 2013 21:58:28 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168#c18">Comment # 18</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168">bug 59168</a>
              from <span class="vcard"><a class="email" href="mailto:p.stastny&#64;gmx.de" title="Petr Stastny &lt;p.stastny&#64;gmx.de&gt;"> <span class="fn">Petr Stastny</span></a>
</span></b>
        <pre>Ok, that must be my mistake. lspci says:

01:00.0 VGA compatible controller: NVIDIA Corporation GF106GLM [Quadro 2000M]
(rev a1)

yes, I have a Thinkpad W520

(In reply to <a href="show_bug.cgi?id=59168#c17">comment #17</a>)
<span class="quote">&gt; You cannot have nv30 card (produced ~8 years ago) in 1-2 years old laptop.
&gt; That would be insane. If &quot;w520&quot; (which I assume is ThinkPad W520) was
&gt; mentioned as a mistake, then please open new bug report.
&gt; 
&gt; <a href="http://nouveau.freedesktop.org/wiki/Bugs">http://nouveau.freedesktop.org/wiki/Bugs</a>
&gt; <a href="http://nouveau.freedesktop.org/wiki/CodeNames">http://nouveau.freedesktop.org/wiki/CodeNames</a></span ></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1361311108.6cc0D75.10820--

--===============1603939015==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1603939015==--
