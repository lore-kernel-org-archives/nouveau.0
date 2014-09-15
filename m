From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 83550] [NVA5] Monitor not restored after resume
 [regression] [bisected]
Date: Mon, 15 Sep 2014 16:49:01 +0000
Message-ID: <bug-83550-8800-9IzeHVFN7U@http.bugs.freedesktop.org/>
References: <bug-83550-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1219182709=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-83550-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1219182709==
Content-Type: multipart/alternative; boundary="1410799741.EfA42.884"; charset="us-ascii"


--1410799741.EfA42.884
Date: Mon, 15 Sep 2014 16:49:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=83550

--- Comment #4 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 106333
  --> https://bugs.freedesktop.org/attachment.cgi?id=106333&action=edit
vbios.rom


cat /sys/kernel/debug/dri/0/vbios.rom > vbios.rom
http://nouveau.freedesktop.org/wiki/DumpingVideoBios

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1410799741.EfA42.884
Date: Mon, 15 Sep 2014 16:49:01 +0000
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
   title="NEW --- - [NVA5] Monitor not restored after resume [regression] [bisected]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83550#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA5] Monitor not restored after resume [regression] [bisected]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83550">bug 83550</a>
              from <span class="vcard"><a class="email" href="mailto:pomidorabelisima&#64;gmail.com" title="poma &lt;pomidorabelisima&#64;gmail.com&gt;"> <span class="fn">poma</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=106333" name="attach_106333" title="vbios.rom">attachment 106333</a> <a href="attachment.cgi?id=106333&amp;action=edit" title="vbios.rom">[details]</a></span>
vbios.rom


cat /sys/kernel/debug/dri/0/vbios.rom &gt; vbios.rom
<a href="http://nouveau.freedesktop.org/wiki/DumpingVideoBios">http://nouveau.freedesktop.org/wiki/DumpingVideoBios</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1410799741.EfA42.884--

--===============1219182709==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1219182709==--
