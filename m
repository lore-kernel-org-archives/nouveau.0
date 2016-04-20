From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94990] Latest 4.6rc4 kernel, no booting on gtx970
Date: Wed, 20 Apr 2016 04:32:16 +0000
Message-ID: <bug-94990-8800-3tRkvnrm2f@http.bugs.freedesktop.org/>
References: <bug-94990-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0169728248=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94990-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0169728248==
Content-Type: multipart/alternative; boundary="14611267362.b2aF.31733";
 charset="UTF-8"


--14611267362.b2aF.31733
Date: Wed, 20 Apr 2016 04:32:16 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94990

--- Comment #12 from Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
This line in the log looks kinda suspicious to me:

[    2.278551] nouveau 0000:01:00.0: enabling device (0000 -> 0003)

I am not seeing it on my end ; could this mean that the Geforce card is a
secondary display device, and that the integrated Intel graphics is the main
one?

In this case maybe you need this patch, which is not in -rc4:
https://lists.freedesktop.org/archives/nouveau/2016-April/024523.html

Also I am surprised by the report that the screen goes blank after this -
failure to initialize GR should not interfere with the ability to display a
framebuffer (only acceleration will be disabled).

Let's make another experiment: can you move /lib/firmware/nvidia/gm204
somewhere else, reboot (you will see a complain about missing firmware files in
the boot log), and tell us whether the display is active after that?

Thanks!

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14611267362.b2aF.31733
Date: Wed, 20 Apr 2016 04:32:16 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Latest 4.6rc4 kernel, no booting on gtx970"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94990#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Latest 4.6rc4 kernel, no booting on gtx970"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94990">bug 94990</a>
              from <span class="vcard"><a class="email" href="mailto:gnurou&#64;gmail.com" title="Alexandre Courbot &lt;gnurou&#64;gmail.com&gt;"> <span class="fn">Alexandre Courbot</span></a>
</span></b>
        <pre>This line in the log looks kinda suspicious to me:

[    2.278551] nouveau 0000:01:00.0: enabling device (0000 -&gt; 0003)

I am not seeing it on my end ; could this mean that the Geforce card is a
secondary display device, and that the integrated Intel graphics is the main
one?

In this case maybe you need this patch, which is not in -rc4:
<a href="https://lists.freedesktop.org/archives/nouveau/2016-April/024523.html">https://lists.freedesktop.org/archives/nouveau/2016-April/024523.html</a>

Also I am surprised by the report that the screen goes blank after this -
failure to initialize GR should not interfere with the ability to display a
framebuffer (only acceleration will be disabled).

Let's make another experiment: can you move /lib/firmware/nvidia/gm204
somewhere else, reboot (you will see a complain about missing firmware files in
the boot log), and tell us whether the display is active after that?

Thanks!</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14611267362.b2aF.31733--

--===============0169728248==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0169728248==--
