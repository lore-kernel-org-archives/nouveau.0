From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73744] [NVA8] Constant lock ups with NVIDIA GeForce
	8400 GS
Date: Tue, 28 Jan 2014 02:09:02 +0000
Message-ID: <bug-73744-8800-64ud3vBG0d@http.bugs.freedesktop.org/>
References: <bug-73744-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0644164024=="
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


--===============0644164024==
Content-Type: multipart/alternative; boundary="1390874942.1cEC1.26212"; charset="us-ascii"


--1390874942.1cEC1.26212
Date: Tue, 28 Jan 2014 02:09:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73744

--- Comment #8 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
There was an issue that suggested that 3.10.x worked well for someone but they
started seeing issues with nva8 on 3.11. Perhaps you can try a 3.10.x kernel.
See bug #69029. If this turns out to help, then do a bisect to figure out the
offending commit.

Also it'd be interesting to see a log after the hang happens -- see if you can
ssh into the machine after the screen hangs.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390874942.1cEC1.26212
Date: Tue, 28 Jan 2014 02:09:02 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73744#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA8] Constant lock ups with NVIDIA GeForce 8400 GS"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73744">bug 73744</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>There was an issue that suggested that 3.10.x worked well for someone but they
started seeing issues with nva8 on 3.11. Perhaps you can try a 3.10.x kernel.
See <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA8] GPU lockup since kernel 3.11 upgrade"
   href="show_bug.cgi?id=69029">bug #69029</a>. If this turns out to help, then do a bisect to figure out the
offending commit.

Also it'd be interesting to see a log after the hang happens -- see if you can
ssh into the machine after the screen hangs.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390874942.1cEC1.26212--

--===============0644164024==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0644164024==--
