From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82714] [G84] nouveau fails to properly initialize GPU
Date: Mon, 30 Mar 2015 19:49:01 +0000
Message-ID: <bug-82714-8800-CVtXiyWkA4@http.bugs.freedesktop.org/>
References: <bug-82714-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0365010266=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-82714-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0365010266==
Content-Type: multipart/alternative; boundary="1427744941.Fa332.7490"; charset="UTF-8"


--1427744941.Fa332.7490
Date: Mon, 30 Mar 2015 19:49:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82714

--- Comment #9 from Bruno <bonbons-lhzhVDjRGQBulxpn9UvDqw@public.gmane.org> ---
Created attachment 114735
  --> https://bugs.freedesktop.org/attachment.cgi?id=114735&action=edit
4.0-rc6 dmesg of nouveau loading (debug, runpm=0)

4.0-rc6 is even worse as it dies shortly after modprobing nouveau (even before
I have the opportunity to launch Xorg).

Results are the same with echo 1 > reset && echo 1 > rescan as without.

Note that nouveau continues spitting out fan update messages after userspace is
dead but eventually stops as well.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1427744941.Fa332.7490
Date: Mon, 30 Mar 2015 19:49:01 +0000
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
   title="REOPENED - [G84] nouveau fails to properly initialize GPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82714#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - [G84] nouveau fails to properly initialize GPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82714">bug 82714</a>
              from <span class="vcard"><a class="email" href="mailto:bonbons&#64;sysophe.eu" title="Bruno &lt;bonbons&#64;sysophe.eu&gt;"> <span class="fn">Bruno</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=114735" name="attach_114735" title="4.0-rc6 dmesg of nouveau loading (debug, runpm=0)">attachment 114735</a> <a href="attachment.cgi?id=114735&amp;action=edit" title="4.0-rc6 dmesg of nouveau loading (debug, runpm=0)">[details]</a></span>
4.0-rc6 dmesg of nouveau loading (debug, runpm=0)

4.0-rc6 is even worse as it dies shortly after modprobing nouveau (even before
I have the opportunity to launch Xorg).

Results are the same with echo 1 &gt; reset &amp;&amp; echo 1 &gt; rescan as without.

Note that nouveau continues spitting out fan update messages after userspace is
dead but eventually stops as well.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1427744941.Fa332.7490--

--===============0365010266==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0365010266==--
