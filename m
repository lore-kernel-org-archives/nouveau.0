From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87179] [NVE7] Warning while reenabling Optimus
	dedicated card
Date: Thu, 11 Dec 2014 02:06:44 +0000
Message-ID: <bug-87179-8800-kERuk5PzKA@http.bugs.freedesktop.org/>
References: <bug-87179-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1782270395=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87179-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1782270395==
Content-Type: multipart/alternative; boundary="1418263604.F8b81.25012"; charset="UTF-8"


--1418263604.F8b81.25012
Date: Thu, 11 Dec 2014 02:06:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87179

--- Comment #3 from Tobias Klausmann <tobias.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org> ---
Created attachment 110703
  --> https://bugs.freedesktop.org/attachment.cgi?id=110703&action=edit
nouveau errors with "110702: possible fix"

While running with the above patch, several (40+) suspend/resume cycles worked
fine. The initial Warning does not seem to get triggered anymore.

Later on the machine hung while resuming, but recovered from the hang. The
attached log is from that timeframe. ~2 min later X was hanging, not
recovering. Could ssh in, nothing in dmesg.

I'm not sure if this is still the same bug or if i should open yet another one.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1418263604.F8b81.25012
Date: Thu, 11 Dec 2014 02:06:44 +0000
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
   title="NEW - [NVE7] Warning while reenabling Optimus dedicated card"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87179#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE7] Warning while reenabling Optimus dedicated card"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87179">bug 87179</a>
              from <span class="vcard"><a class="email" href="mailto:tobias.klausmann&#64;mni.thm.de" title="Tobias Klausmann &lt;tobias.klausmann&#64;mni.thm.de&gt;"> <span class="fn">Tobias Klausmann</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=110703" name="attach_110703" title="nouveau errors with &quot;110702: possible fix&quot;">attachment 110703</a> <a href="attachment.cgi?id=110703&amp;action=edit" title="nouveau errors with &quot;110702: possible fix&quot;">[details]</a></span>
nouveau errors with &quot;110702: possible fix&quot;

While running with the above patch, several (40+) suspend/resume cycles worked
fine. The initial Warning does not seem to get triggered anymore.

Later on the machine hung while resuming, but recovered from the hang. The
attached log is from that timeframe. ~2 min later X was hanging, not
recovering. Could ssh in, nothing in dmesg.

I'm not sure if this is still the same bug or if i should open yet another one.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1418263604.F8b81.25012--

--===============1782270395==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1782270395==--
