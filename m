From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73744] [NVA8] Constant lock ups with NVIDIA GeForce
	8400 GS
Date: Sat, 01 Feb 2014 20:52:07 +0000
Message-ID: <bug-73744-8800-s1IAFJV3za@http.bugs.freedesktop.org/>
References: <bug-73744-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0012205870=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-73744-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0012205870==
Content-Type: multipart/alternative; boundary="1391287927.4bD52bFD1.18769"; charset="us-ascii"


--1391287927.4bD52bFD1.18769
Date: Sat, 1 Feb 2014 20:52:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73744

--- Comment #9 from grave_123-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org ---
(In reply to comment #8)
> There was an issue that suggested that 3.10.x worked well for someone but
> they started seeing issues with nva8 on 3.11. Perhaps you can try a 3.10.x
> kernel. See bug #69029. If this turns out to help, then do a bisect to
> figure out the offending commit.
> 
> Also it'd be interesting to see a log after the hang happens -- see if you
> can ssh into the machine after the screen hangs.

If I can SSH into the machine, what information would you want me to snag in
order to work further towards solving this issue? I have SSH set up right now.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391287927.4bD52bFD1.18769
Date: Sat, 1 Feb 2014 20:52:07 +0000
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
   title="NEW --- - [NVA8] Constant lock ups with NVIDIA GeForce 8400 GS"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73744#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA8] Constant lock ups with NVIDIA GeForce 8400 GS"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73744">bug 73744</a>
              from <span class="vcard"><a class="email" href="mailto:grave_123&#64;riseup.net" title="grave_123&#64;riseup.net">grave_123&#64;riseup.net</a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=73744#c8">comment #8</a>)
<span class="quote">&gt; There was an issue that suggested that 3.10.x worked well for someone but
&gt; they started seeing issues with nva8 on 3.11. Perhaps you can try a 3.10.x
&gt; kernel. See <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA8] GPU lockup since kernel 3.11 upgrade"
   href="show_bug.cgi?id=69029">bug #69029</a>. If this turns out to help, then do a bisect to
&gt; figure out the offending commit.
&gt; 
&gt; Also it'd be interesting to see a log after the hang happens -- see if you
&gt; can ssh into the machine after the screen hangs.</span >

If I can SSH into the machine, what information would you want me to snag in
order to work further towards solving this issue? I have SSH set up right now.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391287927.4bD52bFD1.18769--

--===============0012205870==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0012205870==--
