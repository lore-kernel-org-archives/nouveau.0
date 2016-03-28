From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94725] Nouveau driver fails to load on GM204
Date: Mon, 28 Mar 2016 02:53:31 +0000
Message-ID: <bug-94725-8800-HNnaB3DD6F@http.bugs.freedesktop.org/>
References: <bug-94725-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0070353869=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94725-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0070353869==
Content-Type: multipart/alternative; boundary="14591336111.39472B.18477";
 charset="UTF-8"


--14591336111.39472B.18477
Date: Mon, 28 Mar 2016 02:53:31 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94725

--- Comment #4 from Rashed Abdel-Tawab <rashed-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org> ---
Created attachment 122591
  --> https://bugs.freedesktop.org/attachment.cgi?id=122591&action=edit
dmesg while crashing

Here is the dmesg from when it crashes. I ran lshw and it seems that triggered
the nVidia card to start back up which caused the crash. With runpm=0 the
nVidia card is never powered off so it doesn't crash.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14591336111.39472B.18477
Date: Mon, 28 Mar 2016 02:53:31 +0000
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
   title="NEW - Nouveau driver fails to load on GM204"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94725#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau driver fails to load on GM204"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94725">bug 94725</a>
              from <span class="vcard"><a class="email" href="mailto:rashed&#64;linux.com" title="Rashed Abdel-Tawab &lt;rashed&#64;linux.com&gt;"> <span class="fn">Rashed Abdel-Tawab</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=122591" name="attach_122591" title="dmesg while crashing">attachment 122591</a> <a href="attachment.cgi?id=122591&amp;action=edit" title="dmesg while crashing">[details]</a></span>
dmesg while crashing

Here is the dmesg from when it crashes. I ran lshw and it seems that triggered
the nVidia card to start back up which caused the crash. With runpm=0 the
nVidia card is never powered off so it doesn't crash.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14591336111.39472B.18477--

--===============0070353869==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0070353869==--
