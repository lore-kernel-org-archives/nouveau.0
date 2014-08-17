From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59168] [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic
 garbage/corruption/noise on resume
Date: Sun, 17 Aug 2014 18:37:31 +0000
Message-ID: <bug-59168-8800-kwzq4llKIm@http.bugs.freedesktop.org/>
References: <bug-59168-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0452549949=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59168-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0452549949==
Content-Type: multipart/alternative; boundary="1408300651.3afd482.26425"; charset="us-ascii"


--1408300651.3afd482.26425
Date: Sun, 17 Aug 2014 18:37:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59168

--- Comment #51 from Christian Costa <titan.costa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Well, while updating initramfs, the command complained about bad syntax of
"nouveau.config=PCE1=0" in conf files. I just realized that it was for kernel
options so I used "options nouveau config=PCE1=0" in my conf file instead.

Indeed the nouveau messages flood and the white screen disappear. The login
screen is showed and I can move the mouse cursor but I cannot interact at all
and CTL-ATL-F1 does not work. The mouse cursor disappear after a while. I
cannot do anything apart from rebooting.

I also tried kernel 3.16.1 with same result.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1408300651.3afd482.26425
Date: Sun, 17 Aug 2014 18:37:31 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168#c51">Comment # 51</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168">bug 59168</a>
              from <span class="vcard"><a class="email" href="mailto:titan.costa&#64;gmail.com" title="Christian Costa &lt;titan.costa&#64;gmail.com&gt;"> <span class="fn">Christian Costa</span></a>
</span></b>
        <pre>Well, while updating initramfs, the command complained about bad syntax of
&quot;nouveau.config=PCE1=0&quot; in conf files. I just realized that it was for kernel
options so I used &quot;options nouveau config=PCE1=0&quot; in my conf file instead.

Indeed the nouveau messages flood and the white screen disappear. The login
screen is showed and I can move the mouse cursor but I cannot interact at all
and CTL-ATL-F1 does not work. The mouse cursor disappear after a while. I
cannot do anything apart from rebooting.

I also tried kernel 3.16.1 with same result.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1408300651.3afd482.26425--

--===============0452549949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0452549949==--
