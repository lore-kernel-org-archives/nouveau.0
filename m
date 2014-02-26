From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75511] [NVE7] Unknown opcode in VBIOS on one of 2
 cards, fails boot on 3.13+
Date: Wed, 26 Feb 2014 18:43:00 +0000
Message-ID: <bug-75511-8800-btWhwWKQbG@http.bugs.freedesktop.org/>
References: <bug-75511-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1895883468=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75511-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1895883468==
Content-Type: multipart/alternative; boundary="1393440180.5EBeA0e1.25321"; charset="us-ascii"


--1393440180.5EBeA0e1.25321
Date: Wed, 26 Feb 2014 18:43:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75511

--- Comment #8 from Claas Lorenz <cllorenz-KiJTPfjSHVUubQSw3dWLiw@public.gmane.org> ---
I have a Lenovo Y500 with two GeForce GT 650M cards. I think this laptop was
intended as medium class gaming machine where two graphic cards make sense
somehow. Here is the lspci:

01:00.0 VGA compatible controller: NVIDIA Corporation GK107M [GeForce GT 650M]
(rev a1)
02:00.0 VGA compatible controller: NVIDIA Corporation GK107M [GeForce GT 650M]
(rev a1)

Since I do not use it for gaming, I never cared about having a second card. I
put the working vbios to /lib/firmware and added the config to the kernel line,
as you suggested, and it works fine now (also with 3.13). Thank you very much
for your help!

I also attached my acpidump, I hope that helps.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1393440180.5EBeA0e1.25321
Date: Wed, 26 Feb 2014 18:43:00 +0000
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
   title="NEW --- - [NVE7] Unknown opcode in VBIOS on one of 2 cards, fails boot on 3.13+"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75511#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] Unknown opcode in VBIOS on one of 2 cards, fails boot on 3.13+"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75511">bug 75511</a>
              from <span class="vcard"><a class="email" href="mailto:cllorenz&#64;uni-potsdam.de" title="Claas Lorenz &lt;cllorenz&#64;uni-potsdam.de&gt;"> <span class="fn">Claas Lorenz</span></a>
</span></b>
        <pre>I have a Lenovo Y500 with two GeForce GT 650M cards. I think this laptop was
intended as medium class gaming machine where two graphic cards make sense
somehow. Here is the lspci:

01:00.0 VGA compatible controller: NVIDIA Corporation GK107M [GeForce GT 650M]
(rev a1)
02:00.0 VGA compatible controller: NVIDIA Corporation GK107M [GeForce GT 650M]
(rev a1)

Since I do not use it for gaming, I never cared about having a second card. I
put the working vbios to /lib/firmware and added the config to the kernel line,
as you suggested, and it works fine now (also with 3.13). Thank you very much
for your help!

I also attached my acpidump, I hope that helps.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1393440180.5EBeA0e1.25321--

--===============1895883468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1895883468==--
