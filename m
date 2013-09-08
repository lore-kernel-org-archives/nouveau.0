From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69083] [NV84] using DVI to VGA adapter for CRT and
 specifying supported "PreferredMode" >EDID preferred mode,
 screen output is compressed into small fraction of top scan lines
Date: Sun, 08 Sep 2013 07:56:43 +0000
Message-ID: <bug-69083-8800-E5auJuiGo0@http.bugs.freedesktop.org/>
References: <bug-69083-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0361498025=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69083-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0361498025==
Content-Type: multipart/alternative; boundary="1378627003.38A1F1.3877"; charset="us-ascii"


--1378627003.38A1F1.3877
Date: Sun, 8 Sep 2013 07:56:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69083

--- Comment #4 from Felix Miata <mrmazda-ihVZJaRskl1bRRN4PJnoQQ@public.gmane.org> ---
'xrandr -s 1920x1440 -r 60 && sleep 10 && xrandr -s 1600x1200' scrunched
everything into the top 1/8" of the display and after a brief sleep restored
the working EDID preferred 1600x1200 state.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1378627003.38A1F1.3877
Date: Sun, 8 Sep 2013 07:56:43 +0000
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
   title="NEW --- - [NV84] using DVI to VGA adapter for CRT and specifying supported &quot;PreferredMode&quot; &gt;EDID preferred mode, screen output is compressed into small fraction of top scan lines"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69083#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV84] using DVI to VGA adapter for CRT and specifying supported &quot;PreferredMode&quot; &gt;EDID preferred mode, screen output is compressed into small fraction of top scan lines"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69083">bug 69083</a>
              from <span class="vcard"><a class="email" href="mailto:mrmazda&#64;earthlink.net" title="Felix Miata &lt;mrmazda&#64;earthlink.net&gt;"> <span class="fn">Felix Miata</span></a>
</span></b>
        <pre>'xrandr -s 1920x1440 -r 60 &amp;&amp; sleep 10 &amp;&amp; xrandr -s 1600x1200' scrunched
everything into the top 1/8&quot; of the display and after a brief sleep restored
the working EDID preferred 1600x1200 state.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1378627003.38A1F1.3877--

--===============0361498025==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0361498025==--
