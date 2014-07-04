From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80900] [NVCF] PWM fan speed too high under kernel
	3.15
Date: Fri, 04 Jul 2014 07:35:53 +0000
Message-ID: <bug-80900-8800-DUvTqaNWNc@http.bugs.freedesktop.org/>
References: <bug-80900-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1475097929=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-80900-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1475097929==
Content-Type: multipart/alternative; boundary="1404459353.B013570.540"; charset="us-ascii"


--1404459353.B013570.540
Date: Fri, 4 Jul 2014 07:35:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80900

--- Comment #1 from Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org> ---
(In reply to comment #0)
> Created attachment 102242 [details]
> Dmesg
> 
> Since updating to kernel 3.15, the pwm fan speed of my 550 Ti card is too
> high (above 35% in all situations) when compared with the proprietary NVIDIA
> driver (that hovers around 30%).
> The only way to reduce it to silence once again is to manually change the
> pwm1_max value under sysfs to 30 (by default it's 100).

Can you tell me the temperature of the GPU (run "sensors"). Then, could you
send me your vbios (http://nouveau.freedesktop.org/wiki/DumpingVideoBios/) ?

Thanks for reporting the issue.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1404459353.B013570.540
Date: Fri, 4 Jul 2014 07:35:53 +0000
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
   title="NEW --- - [NVCF] PWM fan speed too high under kernel 3.15"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80900#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVCF] PWM fan speed too high under kernel 3.15"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80900">bug 80900</a>
              from <span class="vcard"><a class="email" href="mailto:martin.peres&#64;ensi-bourges.fr" title="Martin Peres &lt;martin.peres&#64;ensi-bourges.fr&gt;"> <span class="fn">Martin Peres</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=80900#c0">comment #0</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=102242" name="attach_102242" title="Dmesg">attachment 102242</a> <a href="attachment.cgi?id=102242&amp;action=edit" title="Dmesg">[details]</a></span>
&gt; Dmesg
&gt; 
&gt; Since updating to kernel 3.15, the pwm fan speed of my 550 Ti card is too
&gt; high (above 35% in all situations) when compared with the proprietary NVIDIA
&gt; driver (that hovers around 30%).
&gt; The only way to reduce it to silence once again is to manually change the
&gt; pwm1_max value under sysfs to 30 (by default it's 100).</span >

Can you tell me the temperature of the GPU (run &quot;sensors&quot;). Then, could you
send me your vbios (<a href="http://nouveau.freedesktop.org/wiki/DumpingVideoBios/">http://nouveau.freedesktop.org/wiki/DumpingVideoBios/</a>) ?

Thanks for reporting the issue.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1404459353.B013570.540--

--===============1475097929==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1475097929==--
