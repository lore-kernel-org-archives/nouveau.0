From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75447] [NVA0] Secondary gpu is not enabled if
 nouveau is loaded from initrd/initramfs
Date: Mon, 24 Feb 2014 15:45:11 +0000
Message-ID: <bug-75447-8800-a0k11YZGaF@http.bugs.freedesktop.org/>
References: <bug-75447-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1514391618=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75447-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1514391618==
Content-Type: multipart/alternative; boundary="1393256711.cec21.2640"; charset="us-ascii"


--1393256711.cec21.2640
Date: Mon, 24 Feb 2014 15:45:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75447

--- Comment #7 from Alberto <support.intranet-VGgt2q2+T+FeoWH0uzbU5w@public.gmane.org> ---
Hi Emil

I've attached two new dmesg from the same 3.13 kernel. Note that nouveau is
always built as a module, what causes the problem is having it embedded into
the initramfs

Thanks

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1393256711.cec21.2640
Date: Mon, 24 Feb 2014 15:45:11 +0000
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
   title="NEW --- - [NVA0] Secondary gpu is not enabled if nouveau is loaded from initrd/initramfs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75447#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA0] Secondary gpu is not enabled if nouveau is loaded from initrd/initramfs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75447">bug 75447</a>
              from <span class="vcard"><a class="email" href="mailto:support.intranet&#64;libero.it" title="Alberto &lt;support.intranet&#64;libero.it&gt;"> <span class="fn">Alberto</span></a>
</span></b>
        <pre>Hi Emil

I've attached two new dmesg from the same 3.13 kernel. Note that nouveau is
always built as a module, what causes the problem is having it embedded into
the initramfs

Thanks</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1393256711.cec21.2640--

--===============1514391618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1514391618==--
