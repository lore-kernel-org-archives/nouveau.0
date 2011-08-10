From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 32453] SIGABRT caused by malloc around
 exaPrepareAccessReg_mixed
Date: Wed, 10 Aug 2011 09:07:24 -0700 (PDT)
Message-ID: <20110810160725.0923E130137@annarchy.freedesktop.org>
References: <bug-32453-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-32453-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

aHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MzI0NTMKCi0tLSBD
b21tZW50ICMxMCBmcm9tIE1pY2hlbCBEw6RuemVyIDxtaWNoZWxAZGFlbnplci5uZXQ+IDIwMTEt
MDgtMTAgMDk6MDc6MjQgUERUIC0tLQpXb3VsZApodHRwOi8vY2dpdC5mcmVlZGVza3RvcC5vcmcv
eG9yZy94c2VydmVyL3BhdGNoLz9pZD05OWVlYjIxMWM3M2QyOGE2MGY5MDI0ZjQyY2Y5ZjllNDVi
OGIwYzNkCmhhcHBlbiB0byBoZWxwPwoKLS0gCkNvbmZpZ3VyZSBidWdtYWlsOiBodHRwczovL2J1
Z3MuZnJlZWRlc2t0b3Aub3JnL3VzZXJwcmVmcy5jZ2k/dGFiPWVtYWlsCi0tLS0tLS0gWW91IGFy
ZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6IC0tLS0tLS0KWW91IGFyZSB0aGUgYXNzaWdu
ZWUgZm9yIHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
