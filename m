From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59069] nouveau E[     DRM] fail ttm_validate
Date: Sun, 08 May 2016 18:40:08 +0000
Message-ID: <bug-59069-8800-0PWtTSFmWG@http.bugs.freedesktop.org/>
References: <bug-59069-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0724627069=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59069-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0724627069==
Content-Type: multipart/alternative; boundary="14627328086.B6eca8d.17632";
 charset="UTF-8"


--14627328086.B6eca8d.17632
Date: Sun, 8 May 2016 18:40:08 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=59069

--- Comment #36 from Matt Whitlock <freedesktop-wf/ZkUcLzLDBWRuVRseHprNAH6kLmebB@public.gmane.org> ---
This is still a problem in Linux 4.5.3.

I might add that I also see kernel log lines like this (not new in 4.5.3):

[Sun May  8 12:23:15 2016] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 8
[chrome[2561]] subc 0 mthd 0060 data beef0201

The "beef0201" seems suspicious. I have seen other values there, but most often
it's "beef0201". Doesn't this seem like a sentinel value?

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14627328086.B6eca8d.17632
Date: Sun, 8 May 2016 18:40:08 +0000
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
          bz_status_REOPENED "
   title="REOPENED - nouveau E[ DRM] fail ttm_validate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59069#c36">Comment # 36</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - nouveau E[ DRM] fail ttm_validate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59069">bug 59069</a>
              from <span class="vcard"><a class="email" href="mailto:freedesktop&#64;mattwhitlock.name" title="Matt Whitlock &lt;freedesktop&#64;mattwhitlock.name&gt;"> <span class="fn">Matt Whitlock</span></a>
</span></b>
        <pre>This is still a problem in Linux 4.5.3.

I might add that I also see kernel log lines like this (not new in 4.5.3):

[Sun May  8 12:23:15 2016] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 8
[chrome[2561]] subc 0 mthd 0060 data beef0201

The &quot;beef0201&quot; seems suspicious. I have seen other values there, but most often
it's &quot;beef0201&quot;. Doesn't this seem like a sentinel value?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14627328086.B6eca8d.17632--

--===============0724627069==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0724627069==--
