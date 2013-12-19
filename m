From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58378] [NV86] Distorted graphics on NVIDIA GeForce
 8400M G after upgrade the kernel to 3.7.0 version
Date: Thu, 19 Dec 2013 15:26:34 +0000
Message-ID: <bug-58378-8800-SVTCd3rzqA@http.bugs.freedesktop.org/>
References: <bug-58378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1808880770=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58378-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1808880770==
Content-Type: multipart/alternative; boundary="1387466794.0d5dEe5.13186"; charset="us-ascii"


--1387466794.0d5dEe5.13186
Date: Thu, 19 Dec 2013 15:26:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58378

--- Comment #61 from Andreas Loew <awl1-hi6Y0CQ0nG0@public.gmane.org> ---
Hmm... Looking at the code for nvapeek, I fear that nva_rd(...) still did not
return any meaningful data, as it look like we get s == 0...!?


                int s = 0;
                for (i = j = 0; i < 16 && i < b; i+=rs.regsz, j++) {
                        e[j] = nva_rd(&rs, a+i, &z[j]);
                        if (e[j] || z[j])
                                s = 1;
                }
                if (s) {
                        ls = 1;
                        printf ("%08x:", a);
                        for (i = j = 0; i < 16 && i < b; i+=rs.regsz, j++) {
                                nva_rsprint(&rs, e[j], z[j]);
                        }
                        printf ("\n");
                } else {
                        if (ls) printf ("...\n"), ls = 0;
                }

BR,
Andreas

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1387466794.0d5dEe5.13186
Date: Thu, 19 Dec 2013 15:26:34 +0000
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
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378#c61">Comment # 61</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378">bug 58378</a>
              from <span class="vcard"><a class="email" href="mailto:awl1&#64;gmx.net" title="Andreas Loew &lt;awl1&#64;gmx.net&gt;"> <span class="fn">Andreas Loew</span></a>
</span></b>
        <pre>Hmm... Looking at the code for nvapeek, I fear that nva_rd(...) still did not
return any meaningful data, as it look like we get s == 0...!?


                int s = 0;
                for (i = j = 0; i &lt; 16 &amp;&amp; i &lt; b; i+=rs.regsz, j++) {
                        e[j] = nva_rd(&amp;rs, a+i, &amp;z[j]);
                        if (e[j] || z[j])
                                s = 1;
                }
                if (s) {
                        ls = 1;
                        printf (&quot;%08x:&quot;, a);
                        for (i = j = 0; i &lt; 16 &amp;&amp; i &lt; b; i+=rs.regsz, j++) {
                                nva_rsprint(&amp;rs, e[j], z[j]);
                        }
                        printf (&quot;\n&quot;);
                } else {
                        if (ls) printf (&quot;...\n&quot;), ls = 0;
                }

BR,
Andreas</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1387466794.0d5dEe5.13186--

--===============1808880770==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1808880770==--
