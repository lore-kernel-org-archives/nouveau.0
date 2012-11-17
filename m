From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56340] [Ubuntu 10.04.4 LTS 32-bit] Severe
 instability of VIA Technologies Apollo MVP3 chipset and NVIDIA RIVA TNT2
 M64 graphics
Date: Sat, 17 Nov 2012 05:45:58 +0000
Message-ID: <bug-56340-8800-G6jezhgkKB@http.bugs.freedesktop.org/>
References: <bug-56340-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0833824481=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-56340-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0833824481==
Content-Type: multipart/alternative; boundary="1353131158.d12Eb2.27226"; charset="us-ascii"


--1353131158.d12Eb2.27226
Date: Sat, 17 Nov 2012 05:45:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56340

--- Comment #11 from Robert Hancock <hancockrwd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Most likely in 2X mode some of the data transfers to/from the card are getting
corrupted somehow, causing the GPU to not respond as expected and causing the
lockup detection.

I believe that for AGP problems on VIA chipsets, some people had luck with
playing with the "AGP Driving Value" setting in the BIOS, if you have such an
option you can try using different settings for this. (As I recall, most AGP
chipsets would handle this setting automatically but the crappy VIA AGP
implementation used a BIOS setting which sometimes required the user to enter a
different value in the hope it would get the card to work properly.)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1353131158.d12Eb2.27226
Date: Sat, 17 Nov 2012 05:45:58 +0000
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
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [Ubuntu 10.04.4 LTS 32-bit] Severe instability of VIA Technologies Apollo MVP3 chipset and NVIDIA RIVA TNT2 M64 graphics"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56340#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [Ubuntu 10.04.4 LTS 32-bit] Severe instability of VIA Technologies Apollo MVP3 chipset and NVIDIA RIVA TNT2 M64 graphics"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56340">bug 56340</a>
              from <span class="vcard"><a class="email" href="mailto:hancockrwd&#64;gmail.com" title="Robert Hancock &lt;hancockrwd&#64;gmail.com&gt;"> <span class="fn">Robert Hancock</span></a>
</span></b>
        <pre>Most likely in 2X mode some of the data transfers to/from the card are getting
corrupted somehow, causing the GPU to not respond as expected and causing the
lockup detection.

I believe that for AGP problems on VIA chipsets, some people had luck with
playing with the &quot;AGP Driving Value&quot; setting in the BIOS, if you have such an
option you can try using different settings for this. (As I recall, most AGP
chipsets would handle this setting automatically but the crappy VIA AGP
implementation used a BIOS setting which sometimes required the user to enter a
different value in the hope it would get the card to work properly.)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1353131158.d12Eb2.27226--

--===============0833824481==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0833824481==--
