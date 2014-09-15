From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27501] MacBook Pro 5, x unable to boot [NV96 + NVAC]
Date: Mon, 15 Sep 2014 11:01:29 +0000
Message-ID: <bug-27501-8800-g925aXEVpZ@http.bugs.freedesktop.org/>
References: <bug-27501-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0100004422=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-27501-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0100004422==
Content-Type: multipart/alternative; boundary="1410778889.bDDe6.29100"; charset="us-ascii"


--1410778889.bDDe6.29100
Date: Mon, 15 Sep 2014 11:01:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=27501

--- Comment #30 from Rolf Offermanns <rolf.offermanns-hi6Y0CQ0nG0@public.gmane.org> ---
Pierre, the patch works for me (MacBookPro5,2). I had to modify Ilia's patch to
have "MacBookPro5" in the DMI_MATCH instead of "MacBook5" and now I can boot
into a KDE5 session with the nouveau driver. I checked the xorg log file and
verified that it is indeed using hardware accelaration.

I used a fresh git clone of Linus tree for the test.

Let me know if you need further information.

Thanks,
Rolf

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1410778889.bDDe6.29100
Date: Mon, 15 Sep 2014 11:01:29 +0000
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
   title="NEW --- - MacBook Pro 5,x unable to boot [NV96 + NVAC]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=27501#c30">Comment # 30</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - MacBook Pro 5,x unable to boot [NV96 + NVAC]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=27501">bug 27501</a>
              from <span class="vcard"><a class="email" href="mailto:rolf.offermanns&#64;gmx.net" title="Rolf Offermanns &lt;rolf.offermanns&#64;gmx.net&gt;"> <span class="fn">Rolf Offermanns</span></a>
</span></b>
        <pre>Pierre, the patch works for me (MacBookPro5,2). I had to modify Ilia's patch to
have &quot;MacBookPro5&quot; in the DMI_MATCH instead of &quot;MacBook5&quot; and now I can boot
into a KDE5 session with the nouveau driver. I checked the xorg log file and
verified that it is indeed using hardware accelaration.

I used a fresh git clone of Linus tree for the test.

Let me know if you need further information.

Thanks,
Rolf</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1410778889.bDDe6.29100--

--===============0100004422==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0100004422==--
