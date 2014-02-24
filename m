From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75447] [NVA0] Secondary gpu is not enabled if
 nouveau is loaded from initrd/initramfs
Date: Mon, 24 Feb 2014 15:19:28 +0000
Message-ID: <bug-75447-8800-ZRAjTsb0OF@http.bugs.freedesktop.org/>
References: <bug-75447-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0442925049=="
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


--===============0442925049==
Content-Type: multipart/alternative; boundary="1393255168.3A0231.29276"; charset="us-ascii"


--1393255168.3A0231.29276
Date: Mon, 24 Feb 2014 15:19:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75447

Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|Secondary gpu is not        |[NVA0] Secondary gpu is not
                   |enabled if nouveau is       |enabled if nouveau is
                   |loaded from                 |loaded from
                   |initrd/initramfs            |initrd/initramfs

--- Comment #4 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi Alberto

The logs you've attached are from two different kernels.
Can you able to attach the dmesg output of the same kernel, there only
nouveau's build state (module vs built-in) varies ?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1393255168.3A0231.29276
Date: Mon, 24 Feb 2014 15:19:28 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA0] Secondary gpu is not enabled if nouveau is loaded from initrd/initramfs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75447">bug 75447</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>Secondary gpu is not enabled if nouveau is loaded from initrd/initramfs
           </td>
           <td>[NVA0] Secondary gpu is not enabled if nouveau is loaded from initrd/initramfs
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA0] Secondary gpu is not enabled if nouveau is loaded from initrd/initramfs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75447#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA0] Secondary gpu is not enabled if nouveau is loaded from initrd/initramfs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75447">bug 75447</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Hi Alberto

The logs you've attached are from two different kernels.
Can you able to attach the dmesg output of the same kernel, there only
nouveau's build state (module vs built-in) varies ?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1393255168.3A0231.29276--

--===============0442925049==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0442925049==--
