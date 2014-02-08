From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73744] [NVA8] Constant lock ups with NVIDIA GeForce
	8400 GS
Date: Sat, 08 Feb 2014 17:25:11 +0000
Message-ID: <bug-73744-8800-MkuqLRgvzu@http.bugs.freedesktop.org/>
References: <bug-73744-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1772258375=="
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


--===============1772258375==
Content-Type: multipart/alternative; boundary="1391880311.67FcE1.4000"; charset="us-ascii"


--1391880311.67FcE1.4000
Date: Sat, 8 Feb 2014 17:25:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73744

--- Comment #12 from grave_123-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org ---
Hey! The screen locked up and did something far worse than before. I was indeed
able to SSH into my machine and I tried to make a log for dmesg but it was
consumed by UFW output.

However ...

I did manage to cp all of my Xorg logs and found an interesting seg fault!
Attached the log file.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391880311.67FcE1.4000
Date: Sat, 8 Feb 2014 17:25:11 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73744#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA8] Constant lock ups with NVIDIA GeForce 8400 GS"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73744">bug 73744</a>
              from <span class="vcard"><a class="email" href="mailto:grave_123&#64;riseup.net" title="grave_123&#64;riseup.net">grave_123&#64;riseup.net</a>
</span></b>
        <pre>Hey! The screen locked up and did something far worse than before. I was indeed
able to SSH into my machine and I tried to make a log for dmesg but it was
consumed by UFW output.

However ...

I did manage to cp all of my Xorg logs and found an interesting seg fault!
Attached the log file.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391880311.67FcE1.4000--

--===============1772258375==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1772258375==--
