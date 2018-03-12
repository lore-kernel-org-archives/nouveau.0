From: Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: [RFC PATCH 00/13] SVM (share virtual memory) with HMM in nouveau
Date: Mon, 12 Mar 2018 14:28:42 -0400
Message-ID: <ef3d82cd-6c39-a50a-c4cb-d9d9ba13e31b@amd.com>
References: <20180310032141.6096-1-jglisse@redhat.com>
 <cae53b72-f99c-7641-8cb9-5cbe0a29b585@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <cae53b72-f99c-7641-8cb9-5cbe0a29b585@gmail.com>
Content-Language: en-CA
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: christian.koenig@amd.com, jglisse@redhat.com, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: Evgeny Baskakov <ebaskakov@nvidia.com>, Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, linux-mm@kvack.org
List-Id: nouveau.vger.kernel.org

T24gMjAxOC0wMy0xMCAxMDowMSBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4gVG8gYWNj
b21vZGF0ZSB0aG9zZSB3ZSBuZWVkIHRvCj4+IGNyZWF0ZSBhICJob2xlIiBpbnNpZGUgdGhlIHBy
b2Nlc3MgYWRkcmVzcyBzcGFjZS4gVGhpcyBwYXRjaHNldCBoYXZlCj4+IGEgaGFjayBmb3IgdGhh
dCAocGF0Y2ggMTMgSEFDSyBGT1IgSE1NIEFSRUEpLCBpdCByZXNlcnZlcyBhIHJhbmdlIG9mCj4+
IGRldmljZSBmaWxlIG9mZnNldCBzbyB0aGF0IHByb2Nlc3MgY2FuIG1tYXAgdGhpcyByYW5nZSB3
aXRoIFBST1RfTk9ORQo+PiB0byBjcmVhdGUgYSBob2xlIChwcm9jZXNzIG11c3QgbWFrZSBzdXJl
IHRoZSBob2xlIGlzIGJlbG93IDEgPDwgNDApLgo+PiBJIGZlZWwgdW4tZWFzeSBvZiBkb2luZyBp
dCB0aGlzIHdheSBidXQgbWF5YmUgaXQgaXMgb2sgd2l0aCBvdGhlcgo+PiBmb2xrcy4KPgo+IFdl
bGwgd2UgaGF2ZSBlc3NlbnRpYWxseSB0aGUgc2FtZSBwcm9ibGVtIHdpdGggcHJlIGdmeDkgQU1E
IGhhcmR3YXJlLgo+IEZlbGl4IG1pZ2h0IGhhdmUgc29tZSBhZHZpc2UgaG93IGl0IHdhcyBzb2x2
ZWQgZm9yIEhTQS4gCgpGb3IgcHJlLWdmeDkgaGFyZHdhcmUgd2UgcmVzZXJ2ZSBhZGRyZXNzIHNw
YWNlIGluIHVzZXIgbW9kZSB1c2luZyBhIGJpZwptbWFwIFBST1RfTk9ORSBjYWxsIGF0IGFwcGxp
Y2F0aW9uIHN0YXJ0LiBUaGVuIHdlIG1hbmFnZSB0aGUgYWRkcmVzcwpzcGFjZSBpbiB1c2VyIG1v
ZGUgYW5kIHVzZSBNQVBfRklYRUQgdG8gbWFwIGJ1ZmZlcnMgYXQgc3BlY2lmaWMKYWRkcmVzc2Vz
IHdpdGhpbiB0aGUgcmVzZXJ2ZWQgcmFuZ2UuCgpUaGUgYmlnIGFkZHJlc3Mgc3BhY2UgcmVzZXJ2
YXRpb24gY2F1c2VzIGlzc3VlcyBmb3Igc29tZSBkZWJ1Z2dpbmcgdG9vbHMKKGNsYW5nLXNhbml0
aXplciB3YXMgbWVudGlvbmVkIHRvIG1lKSwgc28gd2l0aCBnZng5IHdlJ3JlIGdvaW5nIHRvIGdl
dApyaWQgb2YgdGhpcyBhZGRyZXNzIHNwYWNlIHJlc2VydmF0aW9uLgoKUmVnYXJkcywKwqAgRmVs
aXgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
