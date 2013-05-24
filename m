From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64904] [BISECTED] nouveau,
 nv50: External VGA not detected anymore
Date: Fri, 24 May 2013 20:34:53 +0000
Message-ID: <bug-64904-8800-jRBZmiTEau@http.bugs.freedesktop.org/>
References: <bug-64904-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1849343464=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-64904-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1849343464==
Content-Type: multipart/alternative; boundary="1369427693.58CadD2A2.29475"; charset="us-ascii"


--1369427693.58CadD2A2.29475
Date: Fri, 24 May 2013 20:34:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=64904

--- Comment #2 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi Gerhard

There are three distinct changes introduced with the bad commit

* the timeout has been decreased - 45 > 9.5 ms
* the DPMS_MODE was explicitly set before + after the DAC detection, but not
any more
* the NV50_PDISPLAY_DAC_CLK_CTRL1 was set at the beginning, whereas the new
version is not touching the register

So one at a time, can you increase the delay back to 45ms

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1369427693.58CadD2A2.29475
Date: Fri, 24 May 2013 20:34:53 +0000
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
   title="NEW --- - [BISECTED] nouveau, nv50: External VGA not detected anymore"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64904#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [BISECTED] nouveau, nv50: External VGA not detected anymore"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64904">bug 64904</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Hi Gerhard

There are three distinct changes introduced with the bad commit

* the timeout has been decreased - 45 &gt; 9.5 ms
* the DPMS_MODE was explicitly set before + after the DAC detection, but not
any more
* the NV50_PDISPLAY_DAC_CLK_CTRL1 was set at the beginning, whereas the new
version is not touching the register

So one at a time, can you increase the delay back to 45ms</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1369427693.58CadD2A2.29475--

--===============1849343464==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1849343464==--
