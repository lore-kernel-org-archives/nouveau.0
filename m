From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77102] gallium nouveau has no profile in vdpau and
	libva
Date: Sun, 06 Apr 2014 19:29:25 +0000
Message-ID: <bug-77102-8800-rTHvpVnScM@http.bugs.freedesktop.org/>
References: <bug-77102-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1728114455=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77102-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1728114455==
Content-Type: multipart/alternative; boundary="1396812565.BE475B60.26547"; charset="us-ascii"


--1396812565.BE475B60.26547
Date: Sun, 6 Apr 2014 19:29:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77102

--- Comment #11 from Stefan Ringel <mail-Omqj8X2OoDOCVLKmEEjRFg@public.gmane.org> ---
(In reply to comment #10)
> Would you mind booting with
> 
> nouveau.debug=PBSP=trace
> 
> and putting up a dmesg from that (after the vdpauinfo, that is). BTW, silly
> question -- do you have a libvdpau_nouveau.so?

yes I have libvdpau_nouveau.so. It is installed in /usr/lib64/vdpau .

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1396812565.BE475B60.26547
Date: Sun, 6 Apr 2014 19:29:25 +0000
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
   title="REOPENED --- - gallium nouveau has no profile in vdpau and libva"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77102#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - gallium nouveau has no profile in vdpau and libva"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77102">bug 77102</a>
              from <span class="vcard"><a class="email" href="mailto:mail&#64;stefanringel.de" title="Stefan Ringel &lt;mail&#64;stefanringel.de&gt;"> <span class="fn">Stefan Ringel</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=77102#c10">comment #10</a>)
<span class="quote">&gt; Would you mind booting with
&gt; 
&gt; nouveau.debug=PBSP=trace
&gt; 
&gt; and putting up a dmesg from that (after the vdpauinfo, that is). BTW, silly
&gt; question -- do you have a libvdpau_nouveau.so?</span >

yes I have libvdpau_nouveau.so. It is installed in /usr/lib64/vdpau .</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1396812565.BE475B60.26547--

--===============1728114455==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1728114455==--
